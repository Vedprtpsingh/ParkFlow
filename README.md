# ParkFlow

## Project Description
ParkFlow is a comprehensive, real-time smart parking management system designed to streamline the parking experience for both drivers and operators. The system provides an end-to-end solution, automating vehicle entry and exit, monitoring parking slot availability in real-time, and offering a seamless booking and payment process.

The core mission of ParkFlow is to address the pervasive issue of urban parking by delivering an intelligent platform that optimizes space utilization, reduces traffic congestion, and enhances the overall user experience. By integrating advanced technologies, ParkFlow helps drivers save time, reduces fuel consumption, and creates new revenue streams for parking facility owners.

### Key Features
- **Automated Barrier Control:** Utilizes license plate recognition (LPR) and sensor technology to manage vehicle entry and exit, ensuring authorized access and a smooth flow of traffic.
- **Real-Time Slot Detection:** Employs a network of sensors and computer vision to monitor parking space availability, providing users with up-to-the-minute information.
- **Web and Mobile Interface:** A user-friendly platform for drivers to find, book, and pay for parking slots in advance, complete with navigation assistance.
- **Operator Dashboard:** A powerful analytics dashboard for parking administrators to track usage patterns, manage revenue, and gain insights into operational efficiency.
- **Secure Payment Gateway:** Integrated payment processing for hassle-free and secure transactions, supporting multiple payment methods.
- **User and Vehicle Management:** Allows users to create profiles, register their vehicles, and manage their booking history.

## Tech Stack
- **Backend:** Java 17, Spring Boot 3.4.4 (with Spring Web, Spring Data JPA)
- **Database:** MySQL 8.1.0
- **Frontend:** JSP (Jakarta Server Pages) with JSTL
- **Build Tool:** Apache Maven
- **Server:** Embedded Apache Tomcat
- **Utilities:** Lombok

## System Architecture
ParkFlow is built on a classic three-tier architecture:
1.  **Presentation Layer (Frontend):** The user interface is developed using JSP and JSTL, rendered by an embedded Apache Tomcat server. This layer is responsible for displaying information to the user and capturing their input.
2.  **Business Logic Layer (Backend):** The core application logic is implemented using Spring Boot. This includes handling user requests, processing business rules, and coordinating with the data access layer. The application is structured with controllers, services, and repositories to ensure a clean separation of concerns.
3.  **Data Access Layer:** Spring Data JPA and Hibernate are used to manage the persistence of data in a MySQL database. This layer is responsible for all CRUD (Create, Read, Update, Delete) operations on the database.

## How It Works
The system integrates hardware components such as barrier gates, LPR cameras, and proximity sensors with the backend services and frontend interfaces. When a vehicle approaches an entry or exit point, the system validates it and controls the barrier automatically. Parking slots are monitored in real-time, and their availability is updated in a central database. Users can interact with the system through a web interface to book parking slots, view availability, and manage payments. Operators have access to a comprehensive dashboard for analytics and system management.

## Installation Instructions
1.  **Prerequisites:**
    *   Java 17 JDK
    *   Apache Maven
    *   MySQL Server
2.  **Clone the repository:**
    ```bash
    git clone https://github.com/vedprtpsingh/ParkFlow.git
    cd ParkFlow
    ```
3.  **Database Setup:**
    *   Create a new database in MySQL.
    *   Update the database connection properties in `src/main/resources/application.properties`.
4.  **Build the project:**
    ```bash
    mvn clean install
    ```

## Execution Guide
Run the Spring Boot application using Maven:
```bash
mvn spring-boot:run
```
Alternatively, you can run the packaged JAR file:
```bash
java -jar target/parkflow-0.0.1-SNAPSHOT.jar
```
The application will start on the default port `8080`. You can access it at:
[http://localhost:8080/parkflow/home](http://localhost:8080/parkflow/home)

## Usage
- **User Authentication:** Sign up and log in as a customer or business user.
- **Vehicle Management:** Add and manage vehicles linked to your account.
- **Parking Slot Management:** View, add, and monitor parking slots with real-time availability.
- **Booking and Payment:** Book parking slots, manage your bookings, and process payments securely.
- **Dashboards:** Access customer and business dashboards for an overview of your activities and reports.
- **Informational Pages:** Explore pages like `map`, `about`, `services`, `contact`, `features`, and `forgot password`.

## Demo
You can explore the user interface and features by running the application locally. Future updates will include screenshots and video demonstrations to showcase the system in action.

## Contributing
Contributions are welcome! Please fork the repository, create a feature branch, and submit a pull request. Ensure your code adheres to the project's standards and includes relevant tests.

## Our Team
- [Ved Pratap Singh](https://github.com/vedprtpsingh)
- [Thakur](https://github.com/thakur9044)
- [Nitish Kumar](https://github.com/nitishgithubrit)
- [Prajwal](https://github.com/prajwal12989)

## License
This project is not currently licensed. Please contact the maintainer for more information.

## Contact Info
For any queries or support, please reach out to Ved Pratap Singh at [vedprtpsingh.com].

