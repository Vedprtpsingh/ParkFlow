package com.ved.parkflow.controller;

import com.ved.parkflow.entities.ParkingSlot;
import com.ved.parkflow.services.ParkingSlotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

@Controller
@RequestMapping("/parkflow")
public class ParkingSlotController {

    @Autowired
    private ParkingSlotService parkingSlotService;

    private static final Logger logger = LoggerFactory.getLogger(ParkingSlotController.class);

    @GetMapping("/addParkingSlot")
    public String showAddParkingSlotForm() {
        return "addParkingSlot";
    }

    @PostMapping("/addParkingSlot")
    @ResponseBody
    public String addParkingSlot(@RequestParam("numberOfSlots") int numberOfSlots,
                                 @RequestParam("latitude") double latitude,
                                 @RequestParam("longitude") double longitude) {
        ParkingSlot parkingSlot = new ParkingSlot(numberOfSlots, latitude, longitude);
        logger.info("Adding parking slot: numberOfSlots={}, latitude={}, longitude={}", numberOfSlots, latitude, longitude);
        boolean success = parkingSlotService.addParkingSlot(parkingSlot);
        if (success) {
            logger.info("Parking slot added successfully with id={}", parkingSlot.getId());
            return "success";
        } else {
            logger.error("Failed to add parking slot");
            return "error";
        }
    }

    @GetMapping("/locations")
    @ResponseBody
    public List<ParkingSlot> getAllParkingSlots() {
        return parkingSlotService.getAllParkingSlots();
    }
}
