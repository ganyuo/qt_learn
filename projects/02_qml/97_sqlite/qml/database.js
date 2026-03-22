// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

function dbInit(){
    console.log(" Initializing database...")

    db = LocalStorage.openDatabaseSync("sqlitedemodb", "1.0", "SQLite Demo database", 100000);
    db.transaction( function(tx) {
        print('... create table')
        tx.executeSql('CREATE TABLE IF NOT EXISTS sqlitedemotable(name TEXT, value TEXT)');
    });
}


function storeData(){
    console.log(" Storing data...")

    //Check if the database was ever created
    if (!db){
        return ;
    }

    db.transaction(function(tx){
        //Check if sqlitedemo entry is available in database table
        var result = tx.executeSql('SELECT * from sqlitedemotable where name = "sqlitedemo"');

        //Prepare json object data from qml code
        var obj = { x: root_id.x, y: root_id.y,
            width : root_id.width,height : root_id.height,
            colorred : rect_id.color.r,colorgreen : rect_id.color.g ,
            colorblue : rect_id.color.b };

        if ( result.rows.length ===1 ){
            //Update
            console.log("Updating database table...")
            result = tx.executeSql('UPDATE sqlitedemotable set value=? where name="sqlitedemo"',
                                    [JSON.stringify(obj)])
        }else{
            //Create entry
            console.log("Creating new database table entry")
            result = tx.executeSql('INSERT INTO sqlitedemotable VALUES (?,?)',
                                    ['sqlitedemo', JSON.stringify(obj)])
        }

    });

}


function readData(){
    console.log(" Reading data...")

    if (!db){
        return ;
    }

    db.transaction( function(tx) {
        print('... Reading data from database')
        var result = tx.executeSql('select * from sqlitedemotable where name="sqlitedemo"');

        if(result.rows.length === 1){
            //We have data that we can work  with

            // get the value column
            var value = result.rows[0].value;
            // convert to JS object
            var obj = JSON.parse(value)

            // apply to object
            root_id.x = obj.x;
            root_id.y = obj.y;
            root_id.width= obj.width;
            root_id.height = obj.height
            rect_id.color= Qt.rgba(obj.colorred,obj.colorgreen,obj.colorblue,1)
        }

    });

}
