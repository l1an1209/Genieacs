const fs = require('fs');
const path = require('path');

const buildDir = path.join(__dirname, '../build');
if (!fs.existsSync(buildDir)) fs.mkdirSync(buildDir, { recursive: true });

const content = `export const APP_JS = "/app.js";
export const APP_CSS = "/app.css";
export const FAVICON_PNG = "/favicon.png";
`;

fs.writeFileSync(path.join(buildDir, 'assets.ts'), content);
console.log('build/assets.ts criado com sucesso!');
