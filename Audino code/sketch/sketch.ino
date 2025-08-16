#include <SPI.h>
#include <Ethernet.h>

#define TRIG_PIN 6
#define ECHO_PIN 7
#define RELAY_PIN 8

byte mac[] = { 0xA8, 0x61, 0x0A, 0xAE, 0x42, 0x5B };
IPAddress ip(192, 168, 27, 200);
EthernetServer server(80);

bool monitoring = false;
unsigned long objectGoneTime = 0;
bool objectPreviouslyDetected = false;

void setup() {
  pinMode(RELAY_PIN, OUTPUT);
  digitalWrite(RELAY_PIN, LOW);

  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);

  Serial.begin(9600);
  Ethernet.begin(mac, ip);
  server.begin();
  Serial.print("Server started at ");
  Serial.println(Ethernet.localIP());
}

void loop() {
  EthernetClient client = server.available();
  if (client) {
    String request = client.readStringUntil('\r');
    client.flush();

    if (request.indexOf("GET /toggle") >= 0) {
      Serial.println("Toggle request received.");
      digitalWrite(RELAY_PIN, HIGH); // Barrier opens
      monitoring = true;

      client.println("HTTP/1.1 200 OK");
      client.println("Content-Type: text/plain");
      client.println("Connection: close");
      client.println();
      client.println("Barrier opened, waiting for car to pass...");
    } else {
      client.println("HTTP/1.1 404 Not Found");
      client.println("Content-Type: text/plain");
      client.println("Connection: close");
      client.println();
      client.println("Not found");
    }

    delay(1);
    client.stop();
  }

  if (monitoring) {
    long distance = getDistance();
    Serial.print("Distance: ");
    Serial.println(distance);

    if (distance <= 400) {
      // Object detected
      objectPreviouslyDetected = true;
      objectGoneTime = millis(); // Reset timer
    } else if (objectPreviouslyDetected) {
      // No object now
      if (millis() - objectGoneTime > 1000) { // No object for 1 second
        digitalWrite(RELAY_PIN, LOW); // Barrier closes
        monitoring = false;
        objectPreviouslyDetected = false;
        Serial.println("Car passed. Barrier closed.");
      }
    }

    delay(200); // Moderate polling rate
  }
}

long getDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long duration = pulseIn(ECHO_PIN, HIGH, 5000); // 30ms timeout
  if (duration == 0) return 9999; // No echo
  return duration * 0.034 / 2;
}