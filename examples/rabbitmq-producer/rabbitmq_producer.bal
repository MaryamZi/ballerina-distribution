import ballerinax/rabbitmq;

public type Order record {|
    int orderId;
    string productName;
    decimal price;
    boolean isValid;
|};

public function main() returns error? {
    // Creates a ballerina RabbitMQ client.
    rabbitmq:Client newClient = check new (rabbitmq:DEFAULT_HOST, rabbitmq:DEFAULT_PORT);

    // Publishing messages to an exchange using a routing key.
    // Publishes the message using newClient and the routing key named MyQueue.
    check newClient->publishMessage({content: { orderId: 1,
                                                productName: "Sport shoe",
                                                price: 27.5,
                                                isValid: true
                                              }, routingKey: "OrderQueue"});
}
