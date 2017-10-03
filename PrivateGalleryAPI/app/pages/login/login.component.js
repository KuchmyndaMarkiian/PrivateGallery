"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
var core_1 = require("@angular/core");
var http_1 = require("@angular/http");
var Httpservice = require("../../service/http.service");
var HttpService = Httpservice.HttpService;
var LoginComponent = (function () {
    function LoginComponent(service) {
        this.service = service;
        this.state = "none";
    }
    LoginComponent.prototype.signIn = function () {
        if (this.email == null || this.email === "")
            this.setMessage("Email field is empty");
        else if (this.password == null || this.password === "")
            this.setMessage("Password field is empty");
        else {
            var headers = new http_1.Headers();
            headers.append('Content-Type', 'application/x-www-form-urlencoded');
            headers.append("Accept", 'application/json');
            var params = new http_1.URLSearchParams();
            params.append('grant_type', 'password');
            params.append('username', this.email);
            params.append('password', this.password);
            this.service.createToken("Token", params, headers);
            /*this.service.post("https://localhost:44390/" + 'token', params, { headers: headers })
                .subscribe(response => {
                console.debug(response);
                localStorage.setItem("token", response.json());
            },error =>{console.error(error);});*/
        }
    };
    LoginComponent.prototype.setMessage = function (text) {
        this.message = text;
        this.state = "block";
    };
    return LoginComponent;
}());
LoginComponent = __decorate([
    core_1.Component({
        selector: 'login-app',
        templateUrl: 'app/pages/login/login.html',
        providers: [HttpService]
    }),
    __metadata("design:paramtypes", [HttpService])
], LoginComponent);
exports.LoginComponent = LoginComponent;
//# sourceMappingURL=login.component.js.map