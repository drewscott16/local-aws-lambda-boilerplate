exports.handler = async (event, context) => {
    console.log(event);
    console.log(context);
    console.log("This will output in the running terminal!");
    return "This will show up in the command console!";
}