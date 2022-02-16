package com.apparel.model.entity.user;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue( strategy = GenerationType.AUTO )
    @Column(name = "id")
    private Integer id;

    @Column(name = "title_address",length = 60)
    @NotNull(message = "{error.title_address.null}")
    @Length(max = 60,message = "{error.title_address.max}")
    private String title_address;

    @Column(name = "name",length = 60)
    @NotNull(message = "{error.name.null}")
    @Length(max = 60,message = "{error.name.max}")
    private String name;

    @Column(name = "surname",length = 60)
    @NotNull(message = "{error.surname.null}")
    @Length(max = 60,message = "{error.surname.max}")
    private String surname;

    @Column(name = "city",length = 60)
    @NotNull(message = "{error.city.null}")
    @Length(max = 60,message = "{error.city.max}")
    private String city;

    @Column(name = "district",length = 60)
    @NotNull(message = "{error.district.null}")
    @Length(max = 60,message = "{error.district.max}")
    private String district;

    @Column(name = "neighborhood",length = 60)
    @Length(max = 200,message = "{error.neighborhood.max}")
    private String neighborhood;

    @Column(name = "postcode")
    private String postcode;

    @Column(name = "addressline",length = 350)
    @NotNull(message = "{error.addressline.null}")
    @Length(max = 350,message = "{error.addressline.max}")
    private String addressline;

    @Column(name = "country",length = 50)
    @NotNull(message = "{error.country.null}")
    @Length(max = 50,message = "{error.country.max}")
    private String country;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Override
    public String toString() {
      return  "{"+"\""+"id"+"\""+":"+"\""+id+"\","+
                "\""+"title_address"+"\""+":"+"\""+title_address+"\","+
                "\""+"name"+"\""+":"+"\""+name+"\","+
                "\""+"surname"+"\""+":"+"\""+surname+"\","+
                "\""+"district"+"\""+":"+"\""+district+"\","+
              "\""+"neighborhood"+"\""+":"+"\""+neighborhood+"\","+
              "\""+"postcode"+"\""+":"+"\""+postcode+"\","+
              "\""+"addressline"+"\""+":"+"\""+addressline+"\","+
              "\""+"country"+"\""+":"+"\""+country+"\","+
              "\""+"city"+"\""+":"+"\""+city+"\","+
                "\""+"user"+"\""+":"+"\""+ user.getId()+"\"}";
    }

    public String getCountry() {return country;}

    public void setCountry(String country) {this.country = country;}

    public String getAddressline() {return addressline;}

    public void setAddressline(String addressline) {this.addressline = addressline;}

    public Integer getId() {return id;}

    public void setId(Integer id) {this.id = id;}

    public String getTitle_address() {
        return title_address;
    }

    public void setTitle_address(String title_address) {
        this.title_address = title_address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
