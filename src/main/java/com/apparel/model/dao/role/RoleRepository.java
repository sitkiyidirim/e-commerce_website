package com.apparel.model.dao.role;

import com.apparel.model.entity.user.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{

    public Role findById(Integer id);
}
