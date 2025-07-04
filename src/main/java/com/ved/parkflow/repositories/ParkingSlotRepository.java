package com.ved.parkflow.repositories;

import com.ved.parkflow.entities.ParkingSlot;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ParkingSlotRepository extends JpaRepository<ParkingSlot, Integer> {
    ParkingSlot findByNumberOfSlots(int numberOfSlots);
}
