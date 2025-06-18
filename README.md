# ParkFlow

## Project Description
ParkFlow is a comprehensive real-time vehicle and traffic detection system with smart parking slot monitoring. It automates the entire parking process, from vehicle entry and exit to parking slot detection and user guidance. The system optimizes parking space utilization and enhances user experience through features like automated barrier control, real-time parking availability, booking, and payment management.

### Key Features
- Automated entry and exit barrier control with vehicle validation
- Real-time parking slot detection using sensors and computer vision
- User-friendly mobile app and web interface for booking and navigation
- Operator dashboard with analytics, usage patterns, and revenue tracking
- Payment processing and secure transaction management

## Tech Stack
- Java 17
- Spring Boot 3.4.4
- Spring Boot Starter Web and Data JPA
- MySQL Database
- JSP with JSTL for frontend views
- Lombok for boilerplate code reduction
- Apache Tomcat (embedded) for JSP compilation and server
- Maven for build and dependency management

## How It Works
ParkFlow integrates hardware components like barrier gates, license plate recognition cameras, and proximity sensors with backend services and frontend interfaces. The system detects vehicles approaching entry/exit points, validates them, and controls barriers automatically. Parking slots are monitored in real-time using sensors or computer vision, updating availability status in a central database. Users interact with the system via web interfaces to book parking slots, view availability, and manage payments. Operators use dashboards for analytics and system management.

## Installation Instructions
1. Ensure Java 17 is installed on your system.
2. Install Maven for project build and dependency management.
3. Clone the ParkFlow repository.
4. Configure your MySQL database and update the connection settings in `src/main/resources/application.properties`.
5. Build the project using Maven:
   ```
   mvn clean install
   ```

## Execution Guide
Run the Spring Boot application using Maven:
```
mvn spring-boot:run
```
Alternatively, run the generated jar file:
```
java -jar target/parkflow-0.0.1-SNAPSHOT.jar
```
The application will start on the default port 8080. Access the system via:
```
http://localhost:8080/parkflow/home
```

## Usage
- **User Authentication:** Users can sign up and log in as customers or business users.
- **Vehicle Management:** Add and manage vehicles linked to user accounts.
- **Parking Slot Management:** View, add, and monitor parking slots with real-time availability.
- **Booking and Payment:** Book parking slots, manage bookings, and process payments through the system.
- **Dashboards:** Access customer and business dashboards for activity overview and reports.
- **Informational Pages:** Access pages like map, about, services, contact, features, and forgot password.
- **Additional Features:** View parking maps and system activities via the web interface.

## Demo
Currently, You can explore the user interface and features by running the application locally as described in the Installation and Execution sections. Screenshots and video demos can be added here in the future to showcase the system in action.

## Contributing
Contributions are welcome! Please fork the repository, create a feature branch, and submit a pull request. Ensure code quality and include relevant tests.

## License
This project currently does not have a license. Please contact the maintainer for licensing information.

## Contact Info
Ved Pratap Singh  
Email: [vedprtpsingh.com]  
For queries and support, feel free to reach out.
