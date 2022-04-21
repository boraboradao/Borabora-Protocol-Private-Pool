const fs = require("fs");

const Contracts = ["Apple", "Banana", "Coconut", "Durian"]

function genAbi() {
    fs.access("./build/contracts", (err) => {
        if (err) {
            console.log("run this before truffle compile");
            return
        }

        if (!fsExistsSync("./build/abi")) {
            fs.mkdirSync("./build/abi");
        }

        for (let index in Contracts) {
            fs.writeFile(
                "./build/abi/" + Contracts[index] + ".json",
                JSON.stringify(require('./build/contracts/' + Contracts[index] + '.json').abi),
                function (err) {
                    if (err) {
                        return console.error(err);
                    }
                }
            );
        }
        console.log("success！");
    });
}

function fsExistsSync(path) {
    try{
        fs.accessSync(path,fs.F_OK);
    }catch(e){
        return false;
    }
    return true;
}

genAbi()