import { LightningElement, track, api } from 'lwc';
import saveFile from '@salesforce/apex/UploadImageCTRL.saveFile';
import releatedFiles from '@salesforce/apex/UploadImageCTRL.releatedFiles';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const columns = [
    { label: 'Title', fieldName: 'Title' }
];

export default class ThumbnailImageUpload extends LightningElement {
    @api recordId;
    @track columns = columns;
    @track data;
    @track fileName = '';
    @track UploadFile = 'Trocar Imagem';
    @track showLoadingSpinner = false;
    @track isTrue = false;
    selectedRecords;
    filesUploaded = [];
    file;
    fileContents;
    fileReader;
    content;
    MAX_FILE_SIZE = 1500000;


    connectedCallback() {
        this.getRelatedFiles();
    }

    handleFilesChange(event) {
        if (event.target.files.length > 0) {
            this.filesUploaded = event.target.files;
            this.fileName = event.target.files[0].name;
        }
    }

    handleSave() {
        if (this.filesUploaded.length > 0) {
            this.uploadHelper();
        }
        else {
            this.fileName = 'Selecione a foto que deseja';
        }
    }

    uploadHelper() {
        this.file = this.filesUploaded[0];
        if (this.file.size > this.MAX_FILE_SIZE) {
            window.console.log('Arquivo muito grande');
            return;
        }
        this.showLoadingSpinner = true;
        
        this.fileReader = new FileReader();

        this.fileReader.onloadend = (() => {
            this.fileContents = this.fileReader.result;
            let base64 = 'base64,';
            this.content = this.fileContents.indexOf(base64) + base64.length;
            this.fileContents = this.fileContents.substring(this.content);

            // call the uploadProcess method 
            this.saveToFile();
        });

        this.fileReader.readAsDataURL(this.file);
    }

    // Calling apex class to insert the file
    saveToFile() {
        saveFile({ idParent: this.recordId, strFileName: this.file.name, base64Data: encodeURIComponent(this.fileContents) })
            .then(result => {
                window.console.log('result ====> ' + result);
                // refreshing the datatable
                this.getRelatedFiles();

                this.fileName = this.fileName + ' - Atualizado Com Sucesso!';
                this.UploadFile = 'Arquivo Atualizado com Sucesso!';
                this.isTrue = true;
                this.showLoadingSpinner = false;

                // Showing Success message after file insert
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Sucesso!!!',
                        message: this.file.name + ' - Atualizado Com Sucesso!',
                        variant: 'success',
                    }),
                );

            })
            .catch(error => {
                // Showing errors if any while inserting the files
                window.console.log(error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Erro ao Atualizar Arquivo!',
                        message: error.message,
                        variant: 'error',
                    }),
                );
            });
    }

    // Getting releated files of the current record
    getRelatedFiles() {
        releatedFiles({ idParent: this.recordId })
            .then(data => {
                this.data = data;
                console.log(data);
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Erro!!',
                        message: error.message,
                        variant: 'error',
                    }),
                );
            });
    }

    // Getting selected rows to perform any action
    getSelectedRecords(event) {
        let conDocIds;
        const selectedRows = event.detail.selectedRows;
        conDocIds = new Set();
        // Display that fieldName of the selected rows
        for (let i = 0; i < selectedRows.length; i++) {
            conDocIds.add(selectedRows[i].ContentDocumentId);
        }

        this.selectedRecords = Array.from(conDocIds).join(',');

        window.console.log('SelecioneArquivos=> ' + this.selectedRecords);
    }

}