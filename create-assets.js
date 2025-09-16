// create-assets.js
const fs = require('fs');
const path = require('path');

// Create build directory if it doesn't exist
if (!fs.existsSync('build')) {
  fs.mkdirSync('build');
}

// Create assets.ts file
const content = `
export const APP_JS = '/app.js';
export const APP_CSS = '/app.css';
export const FAVICON_PNG = '/favicon.png';
`;

fs.writeFileSync('build/assets.ts', content);
console.log('✅ assets.ts file created successfully');