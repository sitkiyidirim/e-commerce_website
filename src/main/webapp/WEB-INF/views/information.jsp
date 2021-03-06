<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<meta charset="UTF-8">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/information.css" />
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>




<template:page pageTitle="${title}">
<div class="container-total">
<div class="container-update border border-primary">
    <div id="title">
        <a href="<c:url value='/' />">
                <i class="material-icons back">arrow_back</i>
        </a>
        <i class="material-icons lock">manage_accounts</i> <h5>Manage Account</h5>
    </div>

    <div class="col-md-12">
        <ul class="nav nav-tabs my-2">
            <ul class="nav-item " style="width: 33%">
                <button style="width: 100%" type="button" id="information_script" class="${isValid ? 'nav-link' : 'nav-link bgAndtextcolor' }" onclick="validateFunctionI()" >information</button>
            </ul>
            <ul class="nav-item" style="width: 33%">
                <button style="width: 100%" type="button" id="password_script" class="${(isValid && !isValidAddres) ? 'nav-link bgAndtextcolor' : 'nav-link' }" onclick="validateFunctionP()"  >password</button>
            </ul>

            <ul class="nav-item" style="width: 34%">
                <button style="width: 100%" type="button" id="address_script" class="${(isValid && isValidAddres) ? 'nav-link bgAndtextcolor' : 'nav-link' }" onclick="validateFunctionA()"  >Address</button>
            </ul>
        </ul>
    </div>


    <div class="card">
            <form:form id="form1" cssClass="${isValid ? 'form-container hidden' : 'form-container '}"  name="submitForm" action="informationControl" method="POST">

                <div class="form-group row  hidden " >
                    <label class="col-sm-2 col-form-label ">Name</label>
                    <div class="col-sm-7 ">
                        <div class="input ">
                        <input type="text" class="form-control " name="name" value="${user.getName()}" onclick="validateFunctionName()"
                               placeholder="enter name">
                            <div class="validatecontrolName" >
                                <c:if test="${error[3]}">
                                    <div style="width: 100%" class="alert-information">Namespace cannot be empty!</div>
                                </c:if>
                                <c:if test="${error[4]}">
                                    <div style="width: 100%" class="alert-information">The name must be no more than 50 characters!</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="form-group row ">
                    <label  class="col-sm-2 col-form-label ">Surname</label>
                    <div class="col-sm-7 ">
                        <div class="input ">
                        <input type="text" class="form-control " name="surname" value="${user.getSurname()}" onclick="validateFunctionSurname()"
                               placeholder="enter surname">
                            <div class="validatecontrolSurname">
                                <c:if test="${error[5]}">
                                    <div style="width: 100%" class="alert-information">Last name cannot be left blank!</div>
                                </c:if>
                                <c:if test="${error[6]}">
                                    <div style="width: 100%" class="alert-information">Last name must be a maximum of 50 characters!</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>



                <div class=" form-group row ">
                    <label  class="col-sm-2 col-form-label ">User name</label>
                    <div class="col-sm-7 ">
                        <div class="input ">
                        <input type="text" class="form-control " name="username" value="${user.getUsername()}" onclick="validateFunctionUsername()"
                               placeholder="enter user name">
                            <div class="validatecontrolUsername">
                                <c:if test="${error[0]}">
                                    <div style="width: 100%" class="alert-information">Username cannot be empty!</div>
                                </c:if>
                                <c:if test="${error[1]}">
                                    <div style="width: 100%" class="alert-information">Username already in use!</div>
                                </c:if>
                                <c:if test="${error[2]}">
                                    <div style="width: 100%" class="alert-information">Username cannot exceed 60 characters!</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>




                <div class="form-group row ">
                    <label class="col-sm-2 col-form-label ">Email</label>
                    <div class="col-sm-7 ">
                        <div class="input ">
                        <input type="email" class="form-control " name="mail" value="${user.getMail()}" onclick="validateFunctionEmail()"
                               placeholder="name@example.com" >
                            <div class="validatecontrolEmail">
                                <c:if test="${error[7]}">
                                    <div style="width: 100%" class="alert-information">Email cannot be empty!</div>
                                </c:if>
                                <c:if test="${error[8]}">
                                    <div style="width: 100%" class="alert-information">Email must be a maximum of 60 characters!</div>
                                </c:if>
                                <c:if test="${error[9]}">
                                    <div style="width: 100%" class="alert-information">Email already in use!</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="form-group row ">
                    <label class="col-sm-2 col-form-label ">Gender</label>
                    <div class="col-sm-7 ">
                        <select class="form-control form-control-sm " id="floatingSelectGrid" name="sex" value="${user.getSex()}">
                            <option value="not"><b>I do not want to specify</b></option>
                            <option ${user.getSex()=="Man" ? 'selected="selected"' : ''} value="Man"><b>Male</b></option>
                            <option  ${user.getSex()=="Women" ? 'selected="selected"' : ''} value="Women"><b>Female</b></option>
                        </select>
                    </div>
                </div>



                <div class="form-group row ">
                    <label class="col-sm-2 col-form-label ">Mobile phone</label>
                    <div class="col-sm-7 ">
                        <div class="input ">
                        <input type="text" class="form-control " name="mobilePhone" value="${user.getMobilePhone()}"  onclick="validateFunctionMobilphone()"
                               placeholder="enter mobil phone">
                            <div class="validatecontrolMobilphone">
                                <c:if test="${error[10]}">
                                    <div style="width: 100%" class="alert-information">Mobile number must contain numbers only!</div>
                                </c:if>
                                <c:if test="${error[11]}">
                                    <div style="width: 100%" class="alert-information">Mobile phone number must be 11 digits !</div>
                                </c:if>
                                <c:if test="${error[12]}">
                                    <div style="width: 100%" class="alert-information">Mobile phone already in use !</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>


                <div style="display: block">
                <div class="form-group row ">
                    <label class="col-sm-2 col-form-label ">Home phone</label>
                    <div class="col-sm-7 ">
                        <div class="input ">
                        <input type="text" class="form-control " name="staticPhone" value="${user.getStaticPhone()}"  onclick="validateFunctionStaticphone()"
                               placeholder="enter home phone">
                            <div class="validatecontrolStaticphone">
                                <c:if test="${error[13]}">
                                    <div style="width: 100%" class="alert-information">Home phone number must be numbers only!</div>
                                </c:if>
                                <c:if test="${error[14]}">
                                    <div style="width: 100%" class="alert-information">Home phone must be 11 digits!</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                <div style="display: block">
                <div class="form-group row ">
                    <label class="col-sm-2 col-form-label ">Address</label>
                    <div class="col-sm-7 ">
                        <div class="input ">
                        <input type="text" class="form-control " name="address" value="${user.getAddress()}" onclick="validateFunctionAdress()"
                               placeholder="enter address">
                            <div class="validatecontrolAdress">
                                <c:if test="${error[15]}">
                                    <div style="width: 100%" class="alert-information">Address must be a maximum of 60 characters !</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                <div class="row">
                    <div class="col-sm-12"><button type="submit" class="btn btn-primary">Save</button></div>
                </div>
<%--                <div class="errors">${error}</div>--%>
            </form:form>



         <!---------------------------------------------------->

        <form:form id="form2" cssClass="${(isValid && !isValidAddres) ? 'form-container' : 'form-container hidden'}"  name="submitForm" action="informationControlPassword" method="POST">


            <div class="form-group row ">
                <label  class="col-sm-2 col-form-label ">Password</label>
                <div class="col-sm-7 ">
                    <div class="input-password ">
                        <input type="password" class="form-control " name="updatepassword" id="password" onclick="validateFunctionPassword()"
                               placeholder="enter password">
                        <i class="bi bi-eye-slash" id="togglePassword" onclick="togglePasswordFunction()"></i>
                    </div>
                    <div class="validatecontrolPassword">
                        <c:if test="${errorform2[0]}">
                            <div style="width: 100%" class="alert-information">Password field cannot be empty!</div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="form-group row ">
                <label  class="col-sm-2 col-form-label ">Repassword</label>
                <div class="col-sm-7 ">
                    <div class="input-password ">
                        <input type="password" class="form-control" name="updatrepassword" id="repassword" onclick="validateFunctionRepassword()"
                               placeholder="re-enter your password">
                        <i class="bi bi-eye-slash" id="toggleRepassword" onclick="toggleRepasswordFunction()"></i>
                        </div>
                      <div class="validatecontrolRepassword">
                        <c:if test="${errorform2[1]}">
                            <div style="width: 100%" class="alert-information">password field cannot be empty!</div>
                        </c:if>
                        <c:if test="${errorform2[2]}">
                            <div style="width: 100%" class="alert-information">The passwords you entered do not match!</div>
                        </c:if>
                        <c:if test="${errorform2[3]}">
                            <div style="width: 100%" class="alert-information">password must be at least 6 characters!</div>
                        </c:if>
                    </div>
                </div>
            </div>



            <div class="clearfix"></div>

            <button type="submit" class="btn btn-primary">Save</button>
        </form:form>

<%--      ------------------------------------------   Adresslerim buttonu  -----------------------     --%>
        <br>
        <button id="adreslerimbuttonu" type="button" class="${(isValid && isValidAddres) ? 'btn-primary' : 'hidden btn-primary'}" onclick="adresslerimFunction()">Adreslerim</button>
        <button id="addressAddButtonu" type="button" class="hidden btn-primary" onclick="validateFunctionA()">Adres ekle</button>

        <hr style="margin-right: 2.7%;margin-left: 2.7%">
<%--        -------------------------------- /Adreslerim buttonu  ----------------------------------    --%>
        <!--------------------------------------------------->

            <form:form id="form3" cssClass="${(isValid && isValidAddres && !isValidAdressUpdate) ? 'form-container' : 'form-container hidden'}"  name="submitForm" action="updateAdressControl" method="POST" >

                <div class="form-group row ">
                    <div class="col-sm-10">
                    <label  class="col-form-label ">Adres Ba??l?????? (i?? adresi, ev adresi vb.) *</label>

                            <input cl type="text" class="form-control " name="addressTitle" onclick="validateCForm3TitleFunciton()"
                                   placeholder="enter text">
                        <div class="validateCForm3Title">
                            <c:if test="${updateAdressErrorForm3[0]}">
                                <div style="width: 100%" class="alert-information">adress ba??l?????? bo?? olamaz!</div>
                            </c:if>
                        </div>
                    </div>

                </div>

                <div class="form-group row ">
                    <div class="col-sm-5">
                        <label  class="col-form-label ">Ad</label>
                            <input type="text" class="form-control " name="name" onclick="validateCForm3NameFunciton()"
                                   placeholder="enter text">
                        <div class="validateCForm3Name">
                            <c:if test="${updateAdressErrorForm3[1]}">
                                <div style="width: 100%" class="alert-information">ad bo?? olamaz!</div>
                            </c:if>
                            <c:if test="${updateAdressErrorForm3[2]}">
                                <div style="width: 100%" class="alert-information">ad sadece harflerden olu??mal??!</div>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <label  class="col-form-label ">Soayd</label>
                            <input type="text" class="form-control " name="surname" onclick="validateCForm3SurnameFunciton()"
                                   placeholder="enter text">
                        <div class="validateCForm3Surname">
                            <c:if test="${updateAdressErrorForm3[3]}">
                                <div style="width: 100%" class="alert-information">soyad bo?? olamaz!</div>
                            </c:if>
                            <c:if test="${updateAdressErrorForm3[4]}">
                                <div style="width: 100%" class="alert-information">soyad sadece harflerden olu??mal??!</div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="form-group row ">
                    <div class="col-sm-10">
                    <label  class="col-form-label ">Adres Sat??r??*</label>
                        <textarea type="text" class="form-control " placeholder="enter text" name="addressline" onclick="validateCForm3AdressLineFunciton()"></textarea>
                        <div class="validateCForm3AdressLine">
                            <c:if test="${updateAdressErrorForm3[5]}">
                                <div style="width: 100%" class="alert-information">adres sat??r?? bo?? olamaz!</div>
                            </c:if>
                        </div>
                    </div>

                </div>


                <div class="form-group row ">
                    <div class="col-sm-5">
                        <label  class="col-form-label ">il</label>
                        <select id="Iller" class="form-control" name="city" placeholder="l??tfen il se??iniz" onclick="validateCForm3CityFunciton()">
                        </select>
                        <div class="validateCForm3City">
                            <c:if test="${updateAdressErrorForm3[6]}">
                                <div style="width: 100%" class="alert-information">il bo?? olamaz!</div>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <label  class="col-form-label ">il??e</label>
                        <select id="Ilceler" disabled="disabled" class="form-control" name="district" placeholder="l??tfen il??e se??iniz" onclick="validateCForm3DistrictFunciton()">
                        </select>
                        <div class="validateCForm3District">
                            <c:if test="${updateAdressErrorForm3[7]}">
                                <div style="width: 100%" class="alert-information">il??e bo?? olamaz!</div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="form-group row ">
                    <div class="col-sm-5">
                        <label  class="col-form-label ">??lke</label>
                        <select id="Ulke" class="form-control"   placeholder="l??tfen ??lke se??iniz" name="country">
                            <option value="Turkiye">Turkiye</option>
                        </select>
                        <div class="validatecontrolRepassword">
                            <c:if test="${updateAdressErrorForm3[8]}">
                                <div style="width: 100%" class="alert-information">??lke bo?? olamaz!</div>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <label  class="col-form-label ">posta kodu</label>
                        <input type="text" placeholder="posta kodu giriniz" class="form-control" name="postcode" onclick="validateCForm3PostCodeFunciton()">
                        <div class="validateCForm3PostCode">
                            <c:if test="${updateAdressErrorForm3[9]}">
                                <div style="width: 100%" class="alert-information">sadece rakamlardan ol??ulmal??!</div>
                            </c:if>
                            <c:if test="${updateAdressErrorForm3[10]}">
                                <div style="width: 100%" class="alert-information">5 rakam olmal??!</div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <button type="submit" class="btn btn-primary">Save</button>
            </form:form>
<%--         ---------------------------------------Adreslerim--------------------------------------------    --%>

        <div id="Adreslerimburada" class="hidden" > Adreslerim burada olacak</div>
<%--        ------------------------------------------------------------------------------------    --%>

        <!--------------------------------------------------->

        <form:form id="form4Update" cssClass="${(isValid && isValidAddres && isValidAdressUpdate) ? 'form-container' : 'form-container hidden'}"  name="submitForm" action="updateAdressControlUpdateAdress" method="POST" >

            <hr style="margin-right: 18.5%;margin-left: 1.2%">
            <input style="display: none" id="form4UpdateaddressId"  type="text" class="form-control" name="addressId" value="${adressErrorFormValues.getAddressId()}"
                   placeholder="enter text">


            <div class="form-group row ">
                <div class="col-sm-10">
                    <label  class="col-form-label ">Adres Ba??l?????? (i?? adresi, ev adresi vb.) *</label>

                    <input id="form4UpdateaddressTitle" type="text" class="form-control " name="addressTitle" value="${adressErrorFormValues.getAddressTitle()}" onclick="validateControlForm4TitleFunction()"
                           placeholder="enter text">
                    <div class="validateControlForm4Title">
                        <c:if test="${form4UpdateAdressErrorFormValidate[0]}">
                            <div style="width: 100%" class="alert-information">adress ba??l?????? bo?? olamaz!</div>
                        </c:if>
                    </div>
                </div>

            </div>

            <div class="form-group row ">
                <div class="col-sm-5">
                    <label  class="col-form-label ">Ad</label>
                    <input id="form4UpdateName" type="text" class="form-control " name="name" value="${adressErrorFormValues.getName()}" onclick="validateControlForm4NameFunction()"
                           placeholder="enter text">
                    <div class="validateControlForm4Name">
                        <c:if test="${form4UpdateAdressErrorFormValidate[1]}">
                            <div style="width: 100%" class="alert-information">ad bo?? olamaz!</div>
                        </c:if>
                        <c:if test="${form4UpdateAdressErrorFormValidate[2]}">
                            <div style="width: 100%" class="alert-information">ad sadece harflerden olu??mal??!</div>
                        </c:if>
                    </div>
                </div>
                <div class="col-sm-5">
                    <label  class="col-form-label ">Soayd</label>
                    <input id="form4UpdateSurname" type="text" class="form-control " name="surname" value="${adressErrorFormValues.getSurname()}" onclick="validateControlForm4SurnameFunction()"
                           placeholder="enter text">
                    <div class="validateControlForm4Surname">
                        <c:if test="${form4UpdateAdressErrorFormValidate[3]}">
                            <div style="width: 100%" class="alert-information">soyad bo?? olamaz!</div>
                        </c:if>
                        <c:if test="${form4UpdateAdressErrorFormValidate[4]}">
                            <div style="width: 100%" class="alert-information">soyad sadece harflerden olu??mal??!</div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="form-group row ">
                <div class="col-sm-10">
                    <label  class="col-form-label ">Adres Sat??r??*</label>
                    <textarea id="form4UpdateaddressLine" type="text" class="form-control " placeholder="enter text" name="addressline" value="${adressErrorFormValues.getAddressline()}"  onclick="validateControlForm4AddressLineFunction()" >${adressErrorFormValues.getAddressline()}</textarea>
                    <div class="validateControlForm4AddressLine">
                        <c:if test="${form4UpdateAdressErrorFormValidate[5]}">
                            <div style="width: 100%" class="alert-information">adres sat??r?? bo?? olamaz!</div>
                        </c:if>
                    </div>
                </div>

            </div>


            <div class="form-group row ">
                <div class="col-sm-5">
                    <label  class="col-form-label ">il</label>
                    <select id="form4UpdateCity"  class="form-control" name="city" placeholder="l??tfen il se??iniz" onclick="validateControlForm4CityFunction()">
                        <option id="form4UpdateCitySelect" value="${adressErrorFormValues.getCity()}" selected>${adressErrorFormValuesCity}</option>
                    </select>
                    <div class="validateControlForm4City">
                        <c:if test="${form4UpdateAdressErrorFormValidate[6]}">
                            <div style="width: 100%" class="alert-information">il bo?? olamaz!</div>
                        </c:if>
                    </div>
                </div>
                <div class="col-sm-5">
                    <label  class="col-form-label ">il??e</label>
                    <select id="form4UpdateDistrict" class="form-control" name="district" placeholder="l??tfen il??e se??iniz" onclick="validateControlForm4DistrictFunction()">
                        <option id="form4UpdateDistrictSelect" value="${adressErrorFormValues.getDistrict()}"  selected>${adressErrorFormValues.getDistrict()}</option>
                    </select>
                    <div class="validateControlForm4District">
                        <c:if test="${form4UpdateAdressErrorFormValidate[7]}">
                            <div style="width: 100%" class="alert-information">il??e bo?? olamaz!</div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="form-group row ">
                <div class="col-sm-5">
                    <label  class="col-form-label ">??lke</label>
                    <select id="form4UpdateCountry"  class="form-control"   placeholder="l??tfen ??lke se??iniz" name="country">
                        <option value="Turkiye">Turkiye</option>
                    </select>
                    <div class="">
                        <c:if test="${form4UpdateAdressErrorFormValidate[8]}">
                            <div style="width: 100%" class="alert-information">??lke bo?? olamaz!</div>
                        </c:if>
                    </div>
                </div>
                <div class="col-sm-5">
                    <label  class="col-form-label ">posta kodu</label>
                    <input id="form4UpdatePostcode"   type="text" placeholder="posta kodu giriniz" class="form-control" name="postcode"  value="${adressErrorFormValues.getPostcode()}" onclick="validateControlForm4PostCodeFunction()" >
                    <div class="validateControlForm4PostCode">
                        <c:if test="${form4UpdateAdressErrorFormValidate[9]}">
                            <div style="width: 100%" class="alert-information">sadece rakamlardan ol??ulmal??!</div>
                        </c:if>
                        <c:if test="${form4UpdateAdressErrorFormValidate[10]}">
                            <div style="width: 100%" class="alert-information">5 rakam olmal??!</div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>

            <button type="submit" class="btn btn-primary">Save</button>
        </form:form>
<%--        -------------------------------------------------------  --%>
        </div>
    </div>
</div>
    </div>



    <script type="text/javascript">


     if("${isValidAdressUpdate}"){
         document.getElementById("adreslerimbuttonu").click();

     }

     function  adresslerimFunction(){

         document.getElementById("form3").classList.add("hidden");
         document.getElementById("Adreslerimburada").classList.remove("hidden");
         document.getElementById("adreslerimbuttonu").classList.add("hidden");
         document.getElementById("addressAddButtonu").classList.remove("hidden");

         $.ajax({
             type:"GET",
             url:"/apparel/user/updateAdressControlgetAdress",
             contentType:"charset=utf-8",
             success: function (data){
                 console.log(JSON.parse(data));
                 console.log(data);
                 let dat=JSON.parse(data);

                 document.getElementById("Adreslerimburada").innerHTML="";
                 for (let i=0;i<dat.length;i++){
                     let idim= 'singleAddress'+dat[i].id.toString();
                     document.getElementById("Adreslerimburada").innerHTML+=
                         "<div id="+idim+" class='adressesStyle'>"+
                         "<div>" +"<span style='float: left;margin-top: 5px' class='adressesStyleTitle'>"+dat[i].title_address+"</span>"+
                            "<button type='button' class='btn-primary adressesStyleButtonEdit' onclick='singleAdresEditFunction("+JSON.stringify(dat[i])+")'>"+'Edit'+"</button>"+
                         "<button type='button' class='btn-primary adressesStyleButtonDelete' onclick='singleAdresDeleteFunction("+dat[i].id+")'>"+'Delete'+"</button>"+
                         "</div>"+
                         "<div class='adressesStyleBody'> "+
                         dat[i].name+" "+dat[i].surname+"<br>"+
                         dat[i].addressline+","+dat[i].district+","+dat[i].city+", "+dat[i].postcode+" "+dat[i].country+"</div>"
                    + "</div>";
                 }

             },
             error:function (error){
                 console.log(error)
             }
         })

     }


     function singleAdresEditFunction(datas){

         document.getElementById("form4Update").classList.remove("hidden");

         var adresses=document.getElementsByClassName("adressesStyle");

         for(let i=0;i<adresses.length;i++){
             adresses[i].classList.add("singleAdreesBackgroundColorNormal");
         }

         let adiName='singleAddress'+datas.id.toString();

         document.getElementById(adiName).classList.remove("singleAdreesBackgroundColorNormal");
         document.getElementById(adiName).classList.add("singleAdreesBackgroundColor");

        let citim=plakasearchCity(datas.city);

         document.getElementById("form4UpdateaddressId").value=datas.id;
         document.getElementById("form4UpdateaddressTitle").value=datas.title_address;
         document.getElementById("form4UpdateName").value=datas.name;
         document.getElementById("form4UpdateSurname").value=datas.surname;
         document.getElementById("form4UpdateaddressLine").value=datas.addressline;
         document.getElementById("form4UpdateCitySelect").value=citim;
         document.getElementById("form4UpdateCitySelect").innerText=datas.city;
         document.getElementById("form4UpdateDistrictSelect").value=datas.district;
         document.getElementById("form4UpdateDistrictSelect").innerText=datas.district;
         document.getElementById("form4UpdateCountry").value=datas.country;
         document.getElementById("form4UpdatePostcode").value=datas.postcode;
     }


     function singleAdresDeleteFunction(id){

         let adiName='singleAddress'+id.toString();
         document.getElementById(adiName).classList.add("hidden");

        console.log("silinecek olan??n idisi=== "+id+" ===");
         $.ajax({
             type:"GET",
             url:"/apparel/user/updateAdressControlDeleteAdress",
             data:"id="+id.toString(),
             success: function (data){
             },
             error:function (error){
                 console.log(error)
             }
         })

     }



        function validateFunctionP() {

            document.getElementById("password_script").classList.add("bgAndtextcolor");
            document.getElementById("information_script").classList.remove("bgAndtextcolor");
            document.getElementById("address_script").classList.remove("bgAndtextcolor");

            document.getElementById("form1").classList.add("hidden");
            document.getElementById("form3").classList.add("hidden");
            document.getElementById("form2").classList.remove("hidden");

            document.getElementById("adreslerimbuttonu").classList.add("hidden");

            document.getElementById("Adreslerimburada").classList.add("hidden");
            document.getElementById("form4Update").classList.add("hidden");

            document.getElementById("addressAddButtonu").classList.add("hidden");

        }
        function validateFunctionI() {
            document.getElementById("information_script").classList.add("bgAndtextcolor");
            document.getElementById("password_script").classList.remove("bgAndtextcolor");
            document.getElementById("address_script").classList.remove("bgAndtextcolor");

            document.getElementById("form2").classList.add("hidden");
            document.getElementById("form3").classList.add("hidden");
            document.getElementById("form1").classList.remove("hidden");

            document.getElementById("adreslerimbuttonu").classList.add("hidden");


            document.getElementById("Adreslerimburada").classList.add("hidden");
            document.getElementById("form4Update").classList.add("hidden");

            document.getElementById("addressAddButtonu").classList.add("hidden");

        }

        function validateFunctionA(){
            document.getElementById("address_script").classList.add("bgAndtextcolor");
            document.getElementById("password_script").classList.remove("bgAndtextcolor");
            document.getElementById("information_script").classList.remove("bgAndtextcolor");

            document.getElementById("form3").classList.remove("hidden");
            document.getElementById("form2").classList.add("hidden");
            document.getElementById("form1").classList.add("hidden");

            document.getElementById("adreslerimbuttonu").classList.remove("hidden");
            document.getElementById("form4Update").classList.add("hidden");
            document.getElementById("Adreslerimburada").classList.add("hidden");

            document.getElementById("addressAddButtonu").classList.add("hidden");
        }

     function validateControlForm4PostCodeFunction(){
         var elements=  document.getElementsByClassName("validateControlForm4PostCode");
         elements[0].classList.add("hidden");
     }
     function validateControlForm4TitleFunction(){
         var elements=  document.getElementsByClassName("validateControlForm4Title");
         elements[0].classList.add("hidden");
     }
     function validateControlForm4NameFunction(){
         var elements=  document.getElementsByClassName("validateControlForm4Name");
         elements[0].classList.add("hidden");
     }
     function validateControlForm4SurnameFunction(){
         var elements=  document.getElementsByClassName("validateControlForm4Surname");
         elements[0].classList.add("hidden");
     }
     function validateControlForm4AddressLineFunction(){
         var elements=  document.getElementsByClassName("validateControlForm4AddressLine");
         elements[0].classList.add("hidden");
     }
     function validateControlForm4CityFunction(){
         var elements=  document.getElementsByClassName("validateControlForm4City");
         elements[0].classList.add("hidden");
     }
     function validateControlForm4DistrictFunction(){
         var elements=  document.getElementsByClassName("validateControlForm4District");
         elements[0].classList.add("hidden");
     }




                 function validateCForm3PostCodeFunciton(){
                     var elements=  document.getElementsByClassName("validateCForm3PostCode");
                     elements[0].classList.add("hidden");
                 }
                 function validateCForm3TitleFunciton(){
                     var elements=  document.getElementsByClassName("validateCForm3Title");
                     elements[0].classList.add("hidden");
                 }
                 function validateCForm3NameFunciton(){
                     var elements=  document.getElementsByClassName("validateCForm3Name");
                     elements[0].classList.add("hidden");
                 }
                 function validateCForm3SurnameFunciton(){
                     var elements=  document.getElementsByClassName("validateCForm3Surname");
                     elements[0].classList.add("hidden");
                 }
                 function validateCForm3CityFunciton(){
                     var elements=  document.getElementsByClassName("validateCForm3City");
                     elements[0].classList.add("hidden");
                 }
                 function validateCForm3DistrictFunciton(){
                     var elements=  document.getElementsByClassName("validateCForm3District");
                     elements[0].classList.add("hidden");
                 }
                 function validateCForm3AdressLineFunciton(){
                     var elements=  document.getElementsByClassName("validateCForm3AdressLine");
                     elements[0].classList.add("hidden");
                 }




        function validateFunctionName(){
            var elements=  document.getElementsByClassName("validatecontrolName");
            elements[0].classList.add("hidden");
        }
        function validateFunctionPassword(){
            var elements=  document.getElementsByClassName("validatecontrolPassword");
            elements[0].classList.add("hidden");
        }
        function validateFunctionRepassword(){
            var elements=  document.getElementsByClassName("validatecontrolRepassword");
            elements[0].classList.add("hidden");
        }
        function validateFunctionSurname(){
            var elements=  document.getElementsByClassName("validatecontrolSurname");
            elements[0].classList.add("hidden");
        }
        function validateFunctionUsername(){
            var elements=  document.getElementsByClassName("validatecontrolUsername");
            elements[0].classList.add("hidden");
        }
        function validateFunctionEmail(){
            var elements=  document.getElementsByClassName("validatecontrolEmail");
            elements[0].classList.add("hidden");
        }
        function validateFunctionMobilphone(){
            var elements=  document.getElementsByClassName("validatecontrolMobilphone");
            elements[0].classList.add("hidden");
        }

        function validateFunctionStaticphone(){
            var elements=  document.getElementsByClassName("validatecontrolStaticphone");
            elements[0].classList.add("hidden");
        }
        function validateFunctionAdress(){
            var elements=  document.getElementsByClassName("validatecontrolAdress");
            elements[0].classList.add("hidden");
        }
        function togglePasswordFunction() {
            const togglePassword = document.querySelector("#togglePassword");
            const password = document.querySelector("#password");
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);
            togglePassword.classList.toggle("bi-eye");
        }
        function toggleRepasswordFunction() {
            const toggleRepassword = document.querySelector("#togglerePassword");
            const repassword = document.querySelector("#repassword");
            const type = repassword.getAttribute("type") === "password" ? "text" : "password";
            repassword.setAttribute("type", type);
            toggleRepassword.classList.toggle("bi-eye");
        }


        function plakasearchCity(city){
            console.log("city ne geliyor:::"+city);
         for (let i=0;i<data.length;i++){
             if(data[i].il===city){

                 return data[i].plaka;
             }
         }
        }

        var data = [
            {
                "il": "Adana",
                "plaka": 1,
                "ilceleri": [
                    "Alada??",
                    "Ceyhan",
                    "??ukurova",
                    "Feke",
                    "??mamo??lu",
                    "Karaisal??",
                    "Karata??",
                    "Kozan",
                    "Pozant??",
                    "Saimbeyli",
                    "Sar????am",
                    "Seyhan",
                    "Tufanbeyli",
                    "Yumurtal??k",
                    "Y??re??ir"
                ]
            },
            {
                "il": "Ad??yaman",
                "plaka": 2,
                "ilceleri": [
                    "Besni",
                    "??elikhan",
                    "Gerger",
                    "G??lba????",
                    "Kahta",
                    "Merkez",
                    "Samsat",
                    "Sincik",
                    "Tut"
                ]
            },
            {
                "il": "Afyonkarahisar",
                "plaka": 3,
                "ilceleri": [
                    "Ba??mak????",
                    "Bayat",
                    "Bolvadin",
                    "??ay",
                    "??obanlar",
                    "Dazk??r??",
                    "Dinar",
                    "Emirda??",
                    "Evciler",
                    "Hocalar",
                    "??hsaniye",
                    "??scehisar",
                    "K??z??l??ren",
                    "Merkez",
                    "Sand??kl??",
                    "Sinanpa??a",
                    "Sultanda????",
                    "??uhut"
                ]
            },
            {
                "il": "A??r??",
                "plaka": 4,
                "ilceleri": [
                    "Diyadin",
                    "Do??ubayaz??t",
                    "Ele??kirt",
                    "Hamur",
                    "Merkez",
                    "Patnos",
                    "Ta??l????ay",
                    "Tutak"
                ]
            },
            {
                "il": "Amasya",
                "plaka": 5,
                "ilceleri": [
                    "G??yn??cek",
                    "G??m????hac??k??y",
                    "Hamam??z??",
                    "Merkez",
                    "Merzifon",
                    "Suluova",
                    "Ta??ova"
                ]
            },
            {
                "il": "Ankara",
                "plaka": 6,
                "ilceleri": [
                    "Alt??nda??",
                    "Aya??",
                    "Bala",
                    "Beypazar??",
                    "??aml??dere",
                    "??ankaya",
                    "??ubuk",
                    "Elmada??",
                    "G??d??l",
                    "Haymana",
                    "Kalecik",
                    "K??z??lcahamam",
                    "Nall??han",
                    "Polatl??",
                    "??erefliko??hisar",
                    "Yenimahalle",
                    "G??lba????",
                    "Ke??i??ren",
                    "Mamak",
                    "Sincan",
                    "Kazan",
                    "Akyurt",
                    "Etimesgut",
                    "Evren",
                    "Pursaklar"
                ]
            },
            {
                "il": "Antalya",
                "plaka": 7,
                "ilceleri": [
                    "Akseki",
                    "Alanya",
                    "Elmal??",
                    "Finike",
                    "Gazipa??a",
                    "G??ndo??mu??",
                    "Ka??",
                    "Korkuteli",
                    "Kumluca",
                    "Manavgat",
                    "Serik",
                    "Demre",
                    "??brad??",
                    "Kemer",
                    "Aksu",
                    "D????emealt??",
                    "Kepez",
                    "Konyaalt??",
                    "Muratpa??a"
                ]
            },
            {
                "il": "Artvin",
                "plaka": 8,
                "ilceleri": [
                    "Ardanu??",
                    "Arhavi",
                    "Merkez",
                    "Bor??ka",
                    "Hopa",
                    "??av??at",
                    "Yusufeli",
                    "Murgul"
                ]
            },
            {
                "il": "Ayd??n",
                "plaka": 9,
                "ilceleri": [
                    "Merkez",
                    "Bozdo??an",
                    "Efeler",
                    "??ine",
                    "Germencik",
                    "Karacasu",
                    "Ko??arl??",
                    "Ku??adas??",
                    "Kuyucak",
                    "Nazilli",
                    "S??ke",
                    "Sultanhisar",
                    "Yenipazar",
                    "Buharkent",
                    "??ncirliova",
                    "Karpuzlu",
                    "K????k",
                    "Didim"
                ]
            },
            {
                "il": "Bal??kesir",
                "plaka": 10,
                "ilceleri": [
                    "Alt??eyl??l",
                    "Ayval??k",
                    "Merkez",
                    "Balya",
                    "Band??rma",
                    "Bigadi??",
                    "Burhaniye",
                    "Dursunbey",
                    "Edremit",
                    "Erdek",
                    "G??nen",
                    "Havran",
                    "??vrindi",
                    "Karesi",
                    "Kepsut",
                    "Manyas",
                    "Sava??tepe",
                    "S??nd??rg??",
                    "G??me??",
                    "Susurluk",
                    "Marmara"
                ]
            },
            {
                "il": "Bilecik",
                "plaka": 11,
                "ilceleri": [
                    "Merkez",
                    "Boz??y??k",
                    "G??lpazar??",
                    "Osmaneli",
                    "Pazaryeri",
                    "S??????t",
                    "Yenipazar",
                    "??nhisar"
                ]
            },
            {
                "il": "Bing??l",
                "plaka": 12,
                "ilceleri": [
                    "Merkez",
                    "Gen??",
                    "Karl??ova",
                    "Ki????",
                    "Solhan",
                    "Adakl??",
                    "Yayladere",
                    "Yedisu"
                ]
            },
            {
                "il": "Bitlis",
                "plaka": 13,
                "ilceleri": [
                    "Adilcevaz",
                    "Ahlat",
                    "Merkez",
                    "Hizan",
                    "Mutki",
                    "Tatvan",
                    "G??roymak"
                ]
            },
            {
                "il": "Bolu",
                "plaka": 14,
                "ilceleri": [
                    "Merkez",
                    "Gerede",
                    "G??yn??k",
                    "K??br??sc??k",
                    "Mengen",
                    "Mudurnu",
                    "Seben",
                    "D??rtdivan",
                    "Yeni??a??a"
                ]
            },
            {
                "il": "Burdur",
                "plaka": 15,
                "ilceleri": [
                    "A??lasun",
                    "Bucak",
                    "Merkez",
                    "G??lhisar",
                    "Tefenni",
                    "Ye??ilova",
                    "Karamanl??",
                    "Kemer",
                    "Alt??nyayla",
                    "??avd??r",
                    "??eltik??i"
                ]
            },
            {
                "il": "Bursa",
                "plaka": 16,
                "ilceleri": [
                    "Gemlik",
                    "??neg??l",
                    "??znik",
                    "Karacabey",
                    "Keles",
                    "Mudanya",
                    "Mustafakemalpa??a",
                    "Orhaneli",
                    "Orhangazi",
                    "Yeni??ehir",
                    "B??y??korhan",
                    "Harmanc??k",
                    "Nil??fer",
                    "Osmangazi",
                    "Y??ld??r??m",
                    "G??rsu",
                    "Kestel"
                ]
            },
            {
                "il": "??anakkale",
                "plaka": 17,
                "ilceleri": [
                    "Ayvac??k",
                    "Bayrami??",
                    "Biga",
                    "Bozcaada",
                    "??an",
                    "Merkez",
                    "Eceabat",
                    "Ezine",
                    "Gelibolu",
                    "G??k??eada",
                    "Lapseki",
                    "Yenice"
                ]
            },
            {
                "il": "??ank??r??",
                "plaka": 18,
                "ilceleri": [
                    "Merkez",
                    "??erke??",
                    "Eldivan",
                    "Ilgaz",
                    "Kur??unlu",
                    "Orta",
                    "??aban??z??",
                    "Yaprakl??",
                    "Atkaracalar",
                    "K??z??l??rmak",
                    "Bayram??ren",
                    "Korgun"
                ]
            },
            {
                "il": "??orum",
                "plaka": 19,
                "ilceleri": [
                    "Alaca",
                    "Bayat",
                    "Merkez",
                    "??skilip",
                    "Karg??",
                    "Mecit??z??",
                    "Ortak??y",
                    "Osmanc??k",
                    "Sungurlu",
                    "Bo??azkale",
                    "U??urluda??",
                    "Dodurga",
                    "La??in",
                    "O??uzlar"
                ]
            },
            {
                "il": "Denizli",
                "plaka": 20,
                "ilceleri": [
                    "Ac??payam",
                    "Buldan",
                    "??al",
                    "??ameli",
                    "??ardak",
                    "??ivril",
                    "Merkez",
                    "Merkezefendi",
                    "Pamukkale",
                    "G??ney",
                    "Kale",
                    "Sarayk??y",
                    "Tavas",
                    "Babada??",
                    "Bekilli",
                    "Honaz",
                    "Serinhisar",
                    "Baklan",
                    "Beya??a??",
                    "Bozkurt"
                ]
            },
            {
                "il": "Diyarbak??r",
                "plaka": 21,
                "ilceleri": [
                    "Kocak??y",
                    "??ermik",
                    "????nar",
                    "????ng????",
                    "Dicle",
                    "Ergani",
                    "Hani",
                    "Hazro",
                    "Kulp",
                    "Lice",
                    "Silvan",
                    "E??il",
                    "Ba??lar",
                    "Kayap??nar",
                    "Sur",
                    "Yeni??ehir",
                    "Bismil"
                ]
            },
            {
                "il": "Edirne",
                "plaka": 22,
                "ilceleri": [
                    "Merkez",
                    "Enez",
                    "Havsa",
                    "??psala",
                    "Ke??an",
                    "Lalapa??a",
                    "Meri??",
                    "Uzunk??pr??",
                    "S??lo??lu"
                ]
            },
            {
                "il": "Elaz????",
                "plaka": 23,
                "ilceleri": [
                    "A????n",
                    "Baskil",
                    "Merkez",
                    "Karako??an",
                    "Keban",
                    "Maden",
                    "Palu",
                    "Sivrice",
                    "Ar??cak",
                    "Kovanc??lar",
                    "Alacakaya"
                ]
            },
            {
                "il": "Erzincan",
                "plaka": 24,
                "ilceleri": [
                    "??ay??rl??",
                    "Merkez",
                    "??li??",
                    "Kemah",
                    "Kemaliye",
                    "Refahiye",
                    "Tercan",
                    "??z??ml??",
                    "Otlukbeli"
                ]
            },
            {
                "il": "Erzurum",
                "plaka": 25,
                "ilceleri": [
                    "A??kale",
                    "??at",
                    "H??n??s",
                    "Horasan",
                    "??spir",
                    "Karayaz??",
                    "Narman",
                    "Oltu",
                    "Olur",
                    "Pasinler",
                    "??enkaya",
                    "Tekman",
                    "Tortum",
                    "Kara??oban",
                    "Uzundere",
                    "Pazaryolu",
                    "K??pr??k??y",
                    "Paland??ken",
                    "Yakutiye",
                    "Aziziye"
                ]
            },
            {
                "il": "Eski??ehir",
                "plaka": 26,
                "ilceleri": [
                    "??ifteler",
                    "Mahmudiye",
                    "Mihal????????k",
                    "Sar??cakaya",
                    "Seyitgazi",
                    "Sivrihisar",
                    "Alpu",
                    "Beylikova",
                    "??n??n??",
                    "G??ny??z??",
                    "Han",
                    "Mihalgazi",
                    "Odunpazar??",
                    "Tepeba????"
                ]
            },
            {
                "il": "Gaziantep",
                "plaka": 27,
                "ilceleri": [
                    "Araban",
                    "??slahiye",
                    "Nizip",
                    "O??uzeli",
                    "Yavuzeli",
                    "??ahinbey",
                    "??ehitkamil",
                    "Karkam????",
                    "Nurda????"
                ]
            },
            {
                "il": "Giresun",
                "plaka": 28,
                "ilceleri": [
                    "Alucra",
                    "Bulancak",
                    "Dereli",
                    "Espiye",
                    "Eynesil",
                    "Merkez",
                    "G??rele",
                    "Ke??ap",
                    "??ebinkarahisar",
                    "Tirebolu",
                    "Piraziz",
                    "Ya??l??dere",
                    "??amoluk",
                    "??anak????",
                    "Do??ankent",
                    "G??ce"
                ]
            },
            {
                "il": "G??m????hane",
                "plaka": 29,
                "ilceleri": [
                    "Merkez",
                    "Kelkit",
                    "??iran",
                    "Torul",
                    "K??se",
                    "K??rt??n"
                ]
            },
            {
                "il": "Hakkari",
                "plaka": 30,
                "ilceleri": [
                    "??ukurca",
                    "Merkez",
                    "??emdinli",
                    "Y??ksekova"
                ]
            },
            {
                "il": "Hatay",
                "plaka": 31,
                "ilceleri": [
                    "Alt??n??z??",
                    "Arsuz",
                    "Defne",
                    "D??rtyol",
                    "Hassa",
                    "Antakya",
                    "??skenderun",
                    "K??r??khan",
                    "Payas",
                    "Reyhanl??",
                    "Samanda??",
                    "Yaylada????",
                    "Erzin",
                    "Belen",
                    "Kumlu"
                ]
            },
            {
                "il": "Isparta",
                "plaka": 32,
                "ilceleri": [
                    "Atabey",
                    "E??irdir",
                    "Gelendost",
                    "Merkez",
                    "Ke??iborlu",
                    "Senirkent",
                    "S??t????ler",
                    "??arkikaraa??a??",
                    "Uluborlu",
                    "Yalva??",
                    "Aksu",
                    "G??nen",
                    "Yeni??arbademli"
                ]
            },
            {
                "il": "Mersin",
                "plaka": 33,
                "ilceleri": [
                    "Anamur",
                    "Erdemli",
                    "G??lnar",
                    "Mut",
                    "Silifke",
                    "Tarsus",
                    "Ayd??nc??k",
                    "Bozyaz??",
                    "??aml??yayla",
                    "Akdeniz",
                    "Mezitli",
                    "Toroslar",
                    "Yeni??ehir"
                ]
            },
            {
                "il": "??stanbul",
                "plaka": 34,
                "ilceleri": [
                    "Adalar",
                    "Bak??rk??y",
                    "Be??ikta??",
                    "Beykoz",
                    "Beyo??lu",
                    "??atalca",
                    "Ey??p",
                    "Fatih",
                    "Gaziosmanpa??a",
                    "Kad??k??y",
                    "Kartal",
                    "Sar??yer",
                    "Silivri",
                    "??ile",
                    "??i??li",
                    "??sk??dar",
                    "Zeytinburnu",
                    "B??y??k??ekmece",
                    "Ka????thane",
                    "K??????k??ekmece",
                    "Pendik",
                    "??mraniye",
                    "Bayrampa??a",
                    "Avc??lar",
                    "Ba??c??lar",
                    "Bah??elievler",
                    "G??ng??ren",
                    "Maltepe",
                    "Sultanbeyli",
                    "Tuzla",
                    "Esenler",
                    "Arnavutk??y",
                    "Ata??ehir",
                    "Ba??ak??ehir",
                    "Beylikd??z??",
                    "??ekmek??y",
                    "Esenyurt",
                    "Sancaktepe",
                    "Sultangazi"
                ]
            },
            {
                "il": "??zmir",
                "plaka": 35,
                "ilceleri": [
                    "Alia??a",
                    "Bay??nd??r",
                    "Bergama",
                    "Bornova",
                    "??e??me",
                    "Dikili",
                    "Fo??a",
                    "Karaburun",
                    "Kar????yaka",
                    "Kemalpa??a",
                    "K??n??k",
                    "Kiraz",
                    "Menemen",
                    "??demi??",
                    "Seferihisar",
                    "Sel??uk",
                    "Tire",
                    "Torbal??",
                    "Urla",
                    "Beyda??",
                    "Buca",
                    "Konak",
                    "Menderes",
                    "Bal??ova",
                    "??i??li",
                    "Gaziemir",
                    "Narl??dere",
                    "G??zelbah??e",
                    "Bayrakl??",
                    "Karaba??lar"
                ]
            },
            {
                "il": "Kars",
                "plaka": 36,
                "ilceleri": [
                    "Arpa??ay",
                    "Digor",
                    "Ka????zman",
                    "Merkez",
                    "Sar??kam????",
                    "Selim",
                    "Susuz",
                    "Akyaka"
                ]
            },
            {
                "il": "Kastamonu",
                "plaka": 37,
                "ilceleri": [
                    "Abana",
                    "Ara??",
                    "Azdavay",
                    "Bozkurt",
                    "Cide",
                    "??atalzeytin",
                    "Daday",
                    "Devrekani",
                    "??nebolu",
                    "Merkez",
                    "K??re",
                    "Ta??k??pr??",
                    "Tosya",
                    "??hsangazi",
                    "P??narba????",
                    "??enpazar",
                    "A??l??",
                    "Do??anyurt",
                    "Han??n??",
                    "Seydiler"
                ]
            },
            {
                "il": "Kayseri",
                "plaka": 38,
                "ilceleri": [
                    "B??nyan",
                    "Develi",
                    "Felahiye",
                    "??ncesu",
                    "P??narba????",
                    "Sar??o??lan",
                    "Sar??z",
                    "Tomarza",
                    "Yahyal??",
                    "Ye??ilhisar",
                    "Akk????la",
                    "Talas",
                    "Kocasinan",
                    "Melikgazi",
                    "Hac??lar",
                    "??zvatan"
                ]
            },
            {
                "il": "K??rklareli",
                "plaka": 39,
                "ilceleri": [
                    "Babaeski",
                    "Demirk??y",
                    "Merkez",
                    "Kof??az",
                    "L??leburgaz",
                    "Pehlivank??y",
                    "P??narhisar",
                    "Vize"
                ]
            },
            {
                "il": "K??r??ehir",
                "plaka": 40,
                "ilceleri": [
                    "??i??ekda????",
                    "Kaman",
                    "Merkez",
                    "Mucur",
                    "Akp??nar",
                    "Ak??akent",
                    "Boztepe"
                ]
            },
            {
                "il": "Kocaeli",
                "plaka": 41,
                "ilceleri": [
                    "Gebze",
                    "G??lc??k",
                    "Kand??ra",
                    "Karam??rsel",
                    "K??rfez",
                    "Derince",
                    "Ba??iskele",
                    "??ay??rova",
                    "Dar??ca",
                    "Dilovas??",
                    "??zmit",
                    "Kartepe"
                ]
            },
            {
                "il": "Konya",
                "plaka": 42,
                "ilceleri": [
                    "Ak??ehir",
                    "Bey??ehir",
                    "Bozk??r",
                    "Cihanbeyli",
                    "??umra",
                    "Do??anhisar",
                    "Ere??li",
                    "Hadim",
                    "Ilg??n",
                    "Kad??nhan??",
                    "Karap??nar",
                    "Kulu",
                    "Saray??n??",
                    "Seydi??ehir",
                    "Yunak",
                    "Ak??ren",
                    "Alt??nekin",
                    "Derebucak",
                    "H??y??k",
                    "Karatay",
                    "Meram",
                    "Sel??uklu",
                    "Ta??kent",
                    "Ah??rl??",
                    "??eltik",
                    "Derbent",
                    "Emirgazi",
                    "G??neys??n??r",
                    "Halkap??nar",
                    "Tuzluk??u",
                    "Yal??h??y??k"
                ]
            },
            {
                "il": "K??tahya",
                "plaka": 43,
                "ilceleri": [
                    "Alt??nta??",
                    "Domani??",
                    "Emet",
                    "Gediz",
                    "Merkez",
                    "Simav",
                    "Tav??anl??",
                    "Aslanapa",
                    "Dumlup??nar",
                    "Hisarc??k",
                    "??aphane",
                    "??avdarhisar",
                    "Pazarlar"
                ]
            },
            {
                "il": "Malatya",
                "plaka": 44,
                "ilceleri": [
                    "Ak??ada??",
                    "Arapgir",
                    "Arguvan",
                    "Darende",
                    "Do??an??ehir",
                    "Hekimhan",
                    "Merkez",
                    "P??t??rge",
                    "Ye??ilyurt",
                    "Battalgazi",
                    "Do??anyol",
                    "Kale",
                    "Kuluncak",
                    "Yaz??han"
                ]
            },
            {
                "il": "Manisa",
                "plaka": 45,
                "ilceleri": [
                    "Akhisar",
                    "Ala??ehir",
                    "Demirci",
                    "G??rdes",
                    "K??rka??a??",
                    "Kula",
                    "Merkez",
                    "Salihli",
                    "Sar??g??l",
                    "Saruhanl??",
                    "Selendi",
                    "Soma",
                    "??ehzadeler",
                    "Yunusemre",
                    "Turgutlu",
                    "Ahmetli",
                    "G??lmarmara",
                    "K??pr??ba????"
                ]
            },
            {
                "il": "Kahramanmara??",
                "plaka": 46,
                "ilceleri": [
                    "Af??in",
                    "And??r??n",
                    "Dulkadiro??lu",
                    "Oniki??ubat",
                    "Elbistan",
                    "G??ksun",
                    "Merkez",
                    "Pazarc??k",
                    "T??rko??lu",
                    "??a??layancerit",
                    "Ekin??z??",
                    "Nurhak"
                ]
            },
            {
                "il": "Mardin",
                "plaka": 47,
                "ilceleri": [
                    "Derik",
                    "K??z??ltepe",
                    "Artuklu",
                    "Merkez",
                    "Maz??da????",
                    "Midyat",
                    "Nusaybin",
                    "??merli",
                    "Savur",
                    "Darge??it",
                    "Ye??illi"
                ]
            },
            {
                "il": "Mu??la",
                "plaka": 48,
                "ilceleri": [
                    "Bodrum",
                    "Dat??a",
                    "Fethiye",
                    "K??yce??iz",
                    "Marmaris",
                    "Mente??e",
                    "Milas",
                    "Ula",
                    "Yata??an",
                    "Dalaman",
                    "Seydikemer",
                    "Ortaca",
                    "Kavakl??dere"
                ]
            },
            {
                "il": "Mu??",
                "plaka": 49,
                "ilceleri": [
                    "Bulan??k",
                    "Malazgirt",
                    "Merkez",
                    "Varto",
                    "Hask??y",
                    "Korkut"
                ]
            },
            {
                "il": "Nev??ehir",
                "plaka": 50,
                "ilceleri": [
                    "Avanos",
                    "Derinkuyu",
                    "G??l??ehir",
                    "Hac??bekta??",
                    "Kozakl??",
                    "Merkez",
                    "??rg??p",
                    "Ac??g??l"
                ]
            },
            {
                "il": "Ni??de",
                "plaka": 51,
                "ilceleri": [
                    "Bor",
                    "??amard??",
                    "Merkez",
                    "Uluk????la",
                    "Altunhisar",
                    "??iftlik"
                ]
            },
            {
                "il": "Ordu",
                "plaka": 52,
                "ilceleri": [
                    "Akku??",
                    "Alt??nordu",
                    "Aybast??",
                    "Fatsa",
                    "G??lk??y",
                    "Korgan",
                    "Kumru",
                    "Mesudiye",
                    "Per??embe",
                    "Ulubey",
                    "??nye",
                    "G??lyal??",
                    "G??rgentepe",
                    "??ama??",
                    "??atalp??nar",
                    "??ayba????",
                    "??kizce",
                    "Kabad??z",
                    "Kabata??"
                ]
            },
            {
                "il": "Rize",
                "plaka": 53,
                "ilceleri": [
                    "Arde??en",
                    "??aml??hem??in",
                    "??ayeli",
                    "F??nd??kl??",
                    "??kizdere",
                    "Kalkandere",
                    "Pazar",
                    "Merkez",
                    "G??neysu",
                    "Derepazar??",
                    "Hem??in",
                    "??yidere"
                ]
            },
            {
                "il": "Sakarya",
                "plaka": 54,
                "ilceleri": [
                    "Akyaz??",
                    "Geyve",
                    "Hendek",
                    "Karasu",
                    "Kaynarca",
                    "Sapanca",
                    "Kocaali",
                    "Pamukova",
                    "Tarakl??",
                    "Ferizli",
                    "Karap??r??ek",
                    "S??????tl??",
                    "Adapazar??",
                    "Arifiye",
                    "Erenler",
                    "Serdivan"
                ]
            },
            {
                "il": "Samsun",
                "plaka": 55,
                "ilceleri": [
                    "Ala??am",
                    "Bafra",
                    "??ar??amba",
                    "Havza",
                    "Kavak",
                    "Ladik",
                    "Terme",
                    "Vezirk??pr??",
                    "Asarc??k",
                    "Ondokuzmay??s",
                    "Sal??pazar??",
                    "Tekkek??y",
                    "Ayvac??k",
                    "Yakakent",
                    "Atakum",
                    "Canik",
                    "??lkad??m"
                ]
            },
            {
                "il": "Siirt",
                "plaka": 56,
                "ilceleri": [
                    "Baykan",
                    "Eruh",
                    "Kurtalan",
                    "Pervari",
                    "Merkez",
                    "??irvan",
                    "Tillo"
                ]
            },
            {
                "il": "Sinop",
                "plaka": 57,
                "ilceleri": [
                    "Ayanc??k",
                    "Boyabat",
                    "Dura??an",
                    "Erfelek",
                    "Gerze",
                    "Merkez",
                    "T??rkeli",
                    "Dikmen",
                    "Sarayd??z??"
                ]
            },
            {
                "il": "Sivas",
                "plaka": 58,
                "ilceleri": [
                    "Divri??i",
                    "Gemerek",
                    "G??r??n",
                    "Hafik",
                    "??mranl??",
                    "Kangal",
                    "Koyulhisar",
                    "Merkez",
                    "Su??ehri",
                    "??ark????la",
                    "Y??ld??zeli",
                    "Zara",
                    "Ak??nc??lar",
                    "Alt??nyayla",
                    "Do??an??ar",
                    "G??lova",
                    "Ula??"
                ]
            },
            {
                "il": "Tekirda??",
                "plaka": 59,
                "ilceleri": [
                    "??erkezk??y",
                    "??orlu",
                    "Ergene",
                    "Hayrabolu",
                    "Malkara",
                    "Muratl??",
                    "Saray",
                    "S??leymanpa??a",
                    "Kapakl??",
                    "??ark??y",
                    "Marmaraere??lisi"
                ]
            },
            {
                "il": "Tokat",
                "plaka": 60,
                "ilceleri": [
                    "Almus",
                    "Artova",
                    "Erbaa",
                    "Niksar",
                    "Re??adiye",
                    "Merkez",
                    "Turhal",
                    "Zile",
                    "Pazar",
                    "Ye??ilyurt",
                    "Ba????iftlik",
                    "Sulusaray"
                ]
            },
            {
                "il": "Trabzon",
                "plaka": 61,
                "ilceleri": [
                    "Ak??aabat",
                    "Arakl??",
                    "Arsin",
                    "??aykara",
                    "Ma??ka",
                    "Of",
                    "Ortahisar",
                    "S??rmene",
                    "Tonya",
                    "Vakf??kebir",
                    "Yomra",
                    "Be??ikd??z??",
                    "??alpazar??",
                    "??ar????ba????",
                    "Dernekpazar??",
                    "D??zk??y",
                    "Hayrat",
                    "K??pr??ba????"
                ]
            },
            {
                "il": "Tunceli",
                "plaka": 62,
                "ilceleri": [
                    "??emi??gezek",
                    "Hozat",
                    "Mazgirt",
                    "Naz??miye",
                    "Ovac??k",
                    "Pertek",
                    "P??l??m??r",
                    "Merkez"
                ]
            },
            {
                "il": "??anl??urfa",
                "plaka": 63,
                "ilceleri": [
                    "Ak??akale",
                    "Birecik",
                    "Bozova",
                    "Ceylanp??nar",
                    "Eyy??biye",
                    "Halfeti",
                    "Haliliye",
                    "Hilvan",
                    "Karak??pr??",
                    "Siverek",
                    "Suru??",
                    "Viran??ehir",
                    "Harran"
                ]
            },
            {
                "il": "U??ak",
                "plaka": 64,
                "ilceleri": [
                    "Banaz",
                    "E??me",
                    "Karahall??",
                    "Sivasl??",
                    "Ulubey",
                    "Merkez"
                ]
            },
            {
                "il": "Van",
                "plaka": 65,
                "ilceleri": [
                    "Ba??kale",
                    "??atak",
                    "Erci??",
                    "Geva??",
                    "G??rp??nar",
                    "??pekyolu",
                    "Muradiye",
                    "??zalp",
                    "Tu??ba",
                    "Bah??esaray",
                    "??ald??ran",
                    "Edremit",
                    "Saray"
                ]
            },
            {
                "il": "Yozgat",
                "plaka": 66,
                "ilceleri": [
                    "Akda??madeni",
                    "Bo??azl??yan",
                    "??ay??ralan",
                    "??ekerek",
                    "Sar??kaya",
                    "Sorgun",
                    "??efaatli",
                    "Yerk??y",
                    "Merkez",
                    "Ayd??nc??k",
                    "??and??r",
                    "Kad????ehri",
                    "Saraykent",
                    "Yenifak??l??"
                ]
            },
            {
                "il": "Zonguldak",
                "plaka": 67,
                "ilceleri": [
                    "??aycuma",
                    "Devrek",
                    "Ere??li",
                    "Merkez",
                    "Alapl??",
                    "G??k??ebey"
                ]
            },
            {
                "il": "Aksaray",
                "plaka": 68,
                "ilceleri": [
                    "A??a????ren",
                    "Eskil",
                    "G??la??a??",
                    "G??zelyurt",
                    "Merkez",
                    "Ortak??y",
                    "Sar??yah??i"
                ]
            },
            {
                "il": "Bayburt",
                "plaka": 69,
                "ilceleri": [
                    "Merkez",
                    "Ayd??ntepe",
                    "Demir??z??"
                ]
            },
            {
                "il": "Karaman",
                "plaka": 70,
                "ilceleri": [
                    "Ermenek",
                    "Merkez",
                    "Ayranc??",
                    "Kaz??mkarabekir",
                    "Ba??yayla",
                    "Sar??veliler"
                ]
            },
            {
                "il": "K??r??kkale",
                "plaka": 71,
                "ilceleri": [
                    "Delice",
                    "Keskin",
                    "Merkez",
                    "Sulakyurt",
                    "Bah??ili",
                    "Bal????eyh",
                    "??elebi",
                    "Karake??ili",
                    "Yah??ihan"
                ]
            },
            {
                "il": "Batman",
                "plaka": 72,
                "ilceleri": [
                    "Merkez",
                    "Be??iri",
                    "Gerc????",
                    "Kozluk",
                    "Sason",
                    "Hasankeyf"
                ]
            },
            {
                "il": "????rnak",
                "plaka": 73,
                "ilceleri": [
                    "Beyt??????ebap",
                    "Cizre",
                    "??dil",
                    "Silopi",
                    "Merkez",
                    "Uludere",
                    "G????l??konak"
                ]
            },
            {
                "il": "Bart??n",
                "plaka": 74,
                "ilceleri": [
                    "Merkez",
                    "Kuruca??ile",
                    "Ulus",
                    "Amasra"
                ]
            },
            {
                "il": "Ardahan",
                "plaka": 75,
                "ilceleri": [
                    "Merkez",
                    "????ld??r",
                    "G??le",
                    "Hanak",
                    "Posof",
                    "Damal"
                ]
            },
            {
                "il": "I??d??r",
                "plaka": 76,
                "ilceleri": [
                    "Aral??k",
                    "Merkez",
                    "Tuzluca",
                    "Karakoyunlu"
                ]
            },
            {
                "il": "Yalova",
                "plaka": 77,
                "ilceleri": [
                    "Merkez",
                    "Alt??nova",
                    "Armutlu",
                    "????narc??k",
                    "??iftlikk??y",
                    "Termal"
                ]
            },
            {
                "il": "Karab??k",
                "plaka": 78,
                "ilceleri": [
                    "Eflani",
                    "Eskipazar",
                    "Merkez",
                    "Ovac??k",
                    "Safranbolu",
                    "Yenice"
                ]
            },
            {
                "il": "Kilis",
                "plaka": 79,
                "ilceleri": [
                    "Merkez",
                    "Elbeyli",
                    "Musabeyli",
                    "Polateli"
                ]
            },
            {
                "il": "Osmaniye",
                "plaka": 80,
                "ilceleri": [
                    "Bah??e",
                    "Kadirli",
                    "Merkez",
                    "D??zi??i",
                    "Hasanbeyli",
                    "Sumbas",
                    "Toprakkale"
                ]
            },
            {
                "il": "D??zce",
                "plaka": 81,
                "ilceleri": [
                    "Ak??akoca",
                    "Merkez",
                    "Y??????lca",
                    "Cumayeri",
                    "G??lyaka",
                    "??ilimli",
                    "G??m????ova",
                    "Kayna??l??"
                ]
            }
        ]
        function search(nameKey, myArray){
            for (var i=0; i < myArray.length; i++) {
                if (myArray[i].plaka == nameKey) {
                    return myArray[i];
                }
            }
        }
        $( document ).ready(function() {
            $.each(data, function( index, value ) {
                $('#form4UpdateCity').append($('<option>', {
                    value: value.plaka,
                    text:  value.il
                }));
            });
            $("#form4UpdateCity").change(function(){
                var valueSelected = this.value;
                if(($('#form4UpdateCity').val() > 0) || ($('#form4UpdateCity').val() <= 0)) {
                    $('#form4UpdateDistrict').html('');
                    $('#form4UpdateDistrict').append($('<option>', {
                        value: 0,
                        text:  'L??tfen Bir ??l??e se??iniz'
                    }));
                    $('#form4UpdateDistrict').prop("disabled", false);
                    var resultObject = search($('#form4UpdateCity').val(), data);
                    $.each(resultObject.ilceleri, function( index, value ) {
                        $('#form4UpdateDistrict').append($('<option>', {
                            value: value,
                            text:  value
                        }));
                    });
                    return false;
                }
                $('#form4UpdateDistrict').prop("disabled", false);
            });
        });

    // ----------------

     function search(nameKey, myArray){
         for (var i=0; i < myArray.length; i++) {
             if (myArray[i].plaka == nameKey) {
                 return myArray[i];
             }
         }
     }
     $( document ).ready(function() {
         $.each(data, function( index, value ) {
             $('#Iller').append($('<option>', {
                 value: value.plaka,
                 text:  value.il
             }));
         });
         $("#Iller").change(function(){
             var valueSelected = this.value;
             if($('#Iller').val() > 0) {
                 $('#Ilceler').html('');
                 $('#Ilceler').append($('<option>', {
                     value: 0,
                     text:  'L??tfen Bir ??l??e se??iniz'
                 }));
                 $('#Ilceler').prop("disabled", false);
                 var resultObject = search($('#Iller').val(), data);
                 $.each(resultObject.ilceleri, function( index, value ) {
                     $('#Ilceler').append($('<option>', {
                         value: value,
                         text:  value
                     }));
                 });
                 return false;
             }
             $('#Ilceler').prop("disabled", false);
         });
     });

    </script>
</template:page>
