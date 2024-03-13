/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class RoleAccount {
    private int roid;
    private String rolename;

    public RoleAccount() {
    }

    public RoleAccount(int roid, String rolename) {
        this.roid = roid;
        this.rolename = rolename;
    }

    public int getRoid() {
        return roid;
    }

    public void setRoid(int roid) {
        this.roid = roid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public String toString() {
        return "RoleAccount{" + "roid=" + roid + ", rolename=" + rolename + '}';
    }

    
    
}
