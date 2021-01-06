const express = require('express');
const bodyParser = require('body-parser');
const pg = require('pg');

const app = express();
const PORT = 5000;

//create new pool object
const Pool = pg.Pool;
const pool = new Pool({
    database: 'jazzy_sql',
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'p3LmANHQ$p'
});

//define pool helpers
pool.on('connect', () => {
    console.log('CONNECTED');
});

pool.on('error', (error) => {
    console.log(error);
});

app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static('server/public'));

app.listen(PORT, () => {
    console.log('listening on port', PORT)
});

// TODO - Replace static content with a database tables
/*const artistList = [ 
    {
        name: 'Ella Fitzgerald',
        birthdate: '04-25-1917'
    },
    {
        name: 'Dave Brubeck',
        birthdate: '12-06-1920'
    },       
    {
        name: 'Miles Davis',
        birthdate: '05-26-1926'
    },
    {
        name: 'Esperanza Spalding',
        birthdate: '10-18-1984'
    },
]
const songList = [
    {
        title: 'Take Five',
        length: '5:24',
        released: '1959-09-29'
    },
    {
        title: 'So What',
        length: '9:22',
        released: '1959-08-17'
    },
    {
        title: 'Black Gold',
        length: '5:17',
        released: '2012-02-01'
    }
];*/

app.get('/artist', (req, res) => {
    // console.log(`In /songs GET`);
    // res.send(artistList);
    const queryText = `SELECT * FROM "artist" ORDER BY "birthdate" DESC;`;
    pool.query(queryText)
        .then((result) => {
            console.log(result);
            res.send(result.rows);
        }).catch((error) => {
            console.log(error);
            //Internal Server Error
            res.sendStatus(500);
        });
});

app.post('/artist', (req, res) => {
    artistList.push(req.body);
    res.sendStatus(201);
});

app.get('/song', (req, res) => {
    //console.log(`In /songs GET`);
    //res.send(songList);
    const queryText = `SELECT * FROM "song" ORDER BY "title" ASC`;
    pool.query(queryText)
        .then((result) => {
            console.log(result);
            res.send(result.rows);
        }).catch((error) => {
            console.log(error);
            res.sendStatus(500);
        });
});

app.post('/song', (req, res) => {
    songList.push(req.body);
    res.sendStatus(201);
});


