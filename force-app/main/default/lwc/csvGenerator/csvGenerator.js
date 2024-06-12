// csvGenerator.js
import { LightningElement } from 'lwc';

export default class CsvGenerator extends LightningElement {
    generateCSV() {
        // Sample data
        const data = [
            ['Name', 'Age', 'Location'],
            ['John', 30, 'New York'],
            ['Alice', 25, 'Los Angeles'],
            ['Bob', 35, 'Chicago']
        ];

        // Convert data to CSV format
        const csv = this.convertToCSV(data);

        // Download CSV file
        this.downloadCSV(csv);
    }

    convertToCSV(data) {
        // Convert 2D array to CSV format
        return data.map(row => row.join(',')).join('\n');
    }

    downloadCSV(csv) {
        // Create a hidden anchor element
        const hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'data.csv';
        hiddenElement.click();
    }
}