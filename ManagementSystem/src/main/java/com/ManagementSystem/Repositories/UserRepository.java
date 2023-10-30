package com.ManagementSystem.Repositories;

import com.ManagementSystem.Entities.Customer;
import com.ManagementSystem.Entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

    User findByMobile(String mobile);


}