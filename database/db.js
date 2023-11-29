const {readFileSync} = require('node:fs')
const {join} = require('node:path')
const Database = require('better-sqlite3')

const db = new Database('statesDB.sql')
const schemaPath = join('database', 'schema.sql')
const schema = readFileSync(schemaPath, 'utf-8')
db.exec(schema)

module.exports = db