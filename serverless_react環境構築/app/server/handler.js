// handler.js
module.exports.api = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify({ message: "Hello from Serverless API!" }),
  };
};
