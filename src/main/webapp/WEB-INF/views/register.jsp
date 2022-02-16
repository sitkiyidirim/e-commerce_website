<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" />


<template:page pageTitle="${title}">

  <div class="register-total">
    <div class="container-register border border-primary">
      <div id="title">
        <i class="material-icons lock mataryal-color">lock</i> <h5>Register</h5>
      </div>
      <div class="card ">
          <form:form cssClass="form-container" name="submitForm" action="registerControl" method="POST" >


              <div class="form-group row">
                <label class="col-sm-2 col-form-label">Name</label>
                <div class="col-sm-7">
                  <div class="input">
                  <input type="text" class="form-control" name="name" onclick="validateFunctionName()"
                         placeholder="enter name">
                    <div class="validatecontrolName">
                    <c:if test="${error[5]}">
                      <div style="width: 100%" class="alert-information">Name cannot be empty!</div>
                    </c:if>
                      <c:if test="${error[6]}">
                        <div style="width: 100%" class="alert-information">Name must be no more than 50 characters!</div>
                      </c:if>
                      </div>
                  </div>
                </div>
              </div>

            <div class="clearfix"></div>

              <div class="form-group row">
                <label  class="col-sm-2 col-form-label">Surname</label>
                <div class="col-sm-7">
                  <div class="input">
                  <input type="text" class="form-control" name="surname" onclick="validateFunctionSurname()"
                         placeholder="enter surname">
                    <div class="validatecontrolSurname">
                      <c:if test="${error[7]}">
                        <div style="width: 100%" class="alert-information">Name cannot be empty!</div>
                      </c:if>
                      <c:if test="${error[8]}">
                        <div style="width: 100%" class="alert-information">Last name must be a maximum of 50 characters!</div>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div>

            <div class="clearfix"></div>

            <div class=" form-group row">
              <label  class="col-sm-2 col-form-label">User name</label>
              <div class="col-sm-7">
                <div class="input">
                <input type="text" class="form-control" name="username" onclick="validateFunctionUsername()"
                       placeholder="enter user name">
                  <div class="validatecontrolUsername">
                    <c:if test="${error[0]}">
                      <div style="width: 100%" class="alert-information">User Name cannot be empty!</div>
                    </c:if>
                    <c:if test="${error[1]}">
                      <div style="width: 100%" class="alert-information">Username already in use !</div>
                    </c:if>
                    <c:if test="${error[2]}">
                      <div style="width: 100%" class="alert-information">Username cannot exceed 60 characters!</div>
                    </c:if>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="form-group row">
              <label  class="col-sm-2 col-form-label">Password</label>
              <div class="col-sm-7">
                <div class="input-password">
                <input type="password" class="form-control" name="password" id="password" onclick="validateFunctionPassword()"
                       placeholder="enter password">
                  <i class="bi bi-eye-slash" id="togglePassword" onclick="togglePasswordFunction()"></i>
                </div>
                <div class="validatecontrolPassword">
                  <c:if test="${error[3]}">
                    <div style="width: 100%" class="alert-information">Password cannot be empty!</div>
                  </c:if>
                  <c:if test="${error[4]}">
                    <div style="width: 100%" class="alert-information">password must be at least 6 characters!</div>
                  </c:if>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Email</label>
              <div class="col-sm-7">
                <div class="input">
                <input type="email" class="form-control" name="mail" onclick="validateFunctionEmail()"
                       placeholder="name@example.com" >
                  <div class="validatecontrolEmail">
                    <c:if test="${error[9]}">
                      <div style="width: 100%" class="alert-information">Email cannot be empty!</div>
                    </c:if>
                    <c:if test="${error[10]}">
                      <div style="width: 100%" class="alert-information">Email must be a maximum of 60 characters!</div>
                    </c:if>
                    <c:if test="${error[11]}">
                      <div style="width: 100%" class="alert-information">Email already in use!</div>
                    </c:if>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Gender</label>
              <div class="col-sm-7">
                <select class="form-control form-control-sm" id="floatingSelectGrid" name="sex">
                  <option selected>I do not want to specify</option>
                  <option value="Man">Male</option>
                  <option value="Women">Female</option>
                </select>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Mobile phone</label>
              <div class="col-sm-7">
                <div class="input">
                <input type="text" class="form-control" name="mobilePhone" onclick="validateFunctionMobilphone()"
                       placeholder="enter mobil phone">
                  <div class="validatecontrolMobilphone">
                    <c:if test="${error[12]}">
                      <div style="width: 100%" class="alert-information">Mobile number must contain numbers only!</div>
                    </c:if>
                    <c:if test="${error[13]}">
                      <div style="width: 100%" class="alert-information">Mobile phone number must be 11 digits!</div>
                    </c:if>
                    <c:if test="${error[14]}">
                      <div style="width: 100%" class="alert-information">Mobile phone already in use!</div>
                    </c:if>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div style="display: block">
            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Home phone</label>
              <div class="col-sm-7">
                <div class="input">
                <input type="text" class="form-control" name="staticPhone" onclick="validateFunctionStaticphone()"
                       placeholder="enter home phone">
                  <div class="validatecontrolStaticphone">
                    <c:if test="${error[15]}">
                      <div style="width: 100%" class="alert-information">Home phone number must be numbers only!</div>
                    </c:if>
                    <c:if test="${error[16]}">
                      <div style="width: 100%" class="alert-information">Home phone must be 11 digits!</div>
                    </c:if>
                  </div>
                </div>
              </div>
            </div>
            </div>

            <div class="clearfix"></div>

            <div style="display: block">
            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Address</label>
              <div class="col-sm-7">
                <div class="input">
                <input type="text" class="form-control" name="address" onclick="validateFunctionAdress()"
                       placeholder="enter address">
                  <div class="validatecontrolAdress">
                    <c:if test="${error[17]}">
                      <div style="width: 100%" class="alert-information">Address must be a maximum of 60 characters!</div>
                    </c:if>
                  </div>
                </div>
              </div>
            </div>
            </div>

            <div class="clearfix"></div>
            <div class="row">
              <div class="col-sm-4 buttons">
                <a href="<c:url value='/user/login' />">
                  <button class="btn btn-warning btn-login text-uppercase fw-bold login-btn" type="button">
                    Login
                  </button>
                </a>
                </div>
              <div class="col-sm-4">
            <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </div>
            <div class="clearfix"></div>

            <c:if test="${error[17]}">
              <div style="width: 60%;margin-left: 15%;margin-top: 8px" class="alert-information">Please fill in this form !!</div>
            </c:if>
          </form:form>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    function validateFunctionName(){
      var elements=  document.getElementsByClassName("validatecontrolName");
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
    function validateFunctionPassword(){
      var elements=  document.getElementsByClassName("validatecontrolPassword");
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
  </script>

</template:page>
