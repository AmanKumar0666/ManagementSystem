package com.ManagementSystem.Entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Customer {
    @Id
    private long id;
    private String fullName;
    private String gender;
    private String address;
    private String email;
    private String mobile;
    private int noOfRooms;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkInDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkOutDate;

    private int noOfDays;
    private String hotelName;
    private String hotelLocation;
    private String hotelPrice;
    private String totalPrice;

}
