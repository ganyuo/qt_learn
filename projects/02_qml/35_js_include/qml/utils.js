// .import "sub_utils.js" as Sub_utils;
Qt.include("sub_utils.js")

function greeting()
{
    console.log("hello world");
}

function combine_ages(age1, age2)
{
    return Sub_utils.add(age1, age2);
}