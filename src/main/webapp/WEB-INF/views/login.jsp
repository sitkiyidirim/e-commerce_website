<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />


<template:page pageTitle="${title}">
<div class="login-container" >
    <div class="login-marginTotal ">
    <div class="row ">
        <div class="col-md-9  mx-auto login-card">
            <div class="card border-0 shadow rounded-3 my-5 login-card">
                <div class="card-body p-4 p-sm-5 ">
                    <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
                    <form:form name="submitForm" action="userControl" method="POST">

                        <div class="form-floating mb-3">
                            <label for="floatingInput"><b>Username</b></label>
                            <input type="text" class="form-control" id="floatingInput" placeholder="Username"  name="userName" onclick="validateFunctionError()">
                        </div>
                        <div class="form-floating mb-3">
                            <label for="floatingPassword"><b>Password</b></label>
                            <div class="input">
                                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" onclick="validateFunctionError()">
                                <i class="bi bi-eye-slash" id="togglePassword" onclick="togglePasswordFunction()"></i>
                            </div>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        <div class="d-grid">
                            <input class="btn btn-primary btn-login text-uppercase fw-bold " type="submit" value="Login">
                            <br>
                            <div class="validatecontrolErrors">
                                <c:if test="${iserrorLogin}">
                                <div class="alert-information" >${error}</div>
                                </c:if>
                            </div>
                        </div>

                        <hr class="my-4">
                        <div class="d-grid">
                            <a href="<c:url value='/userregister/register' />">
                                <button class="btn btn-warning btn-login text-uppercase fw-bold redirect-btn" type="button">
                                    Create Account
                                </button>
                            </a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

    <script type="text/javascript">
        function togglePasswordFunction() {
            const togglePassword = document.querySelector("#togglePassword");
            const password = document.querySelector("#floatingPassword");
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);
            togglePassword.classList.toggle("bi-eye");
        }
        function validateFunctionError(){
                var elements=  document.getElementsByClassName("validatecontrolErrors");
                elements[0].classList.add("hidden");
        }
    </script>
</template:page>
