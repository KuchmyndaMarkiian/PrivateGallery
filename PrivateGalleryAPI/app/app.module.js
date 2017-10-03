"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
var core_1 = require("@angular/core");
var platform_browser_1 = require("@angular/platform-browser");
var forms_1 = require("@angular/forms");
var http_1 = require("@angular/http");
var router_1 = require("@angular/router");
var mainComponent = require("./main.component");
var Main = mainComponent.MainComponent;
var loginComponent = require("./pages/login/login.component");
var Login = loginComponent.LoginComponent;
var registerComponent = require("./pages/register/register.component");
var Register = registerComponent.RegisterComponent;
var appRoutes = [
    { path: '', component: Main },
    { path: 'login', component: Login },
    { path: 'register', component: Register }
];
var AppModule = (function () {
    function AppModule() {
    }
    return AppModule;
}());
AppModule = __decorate([
    core_1.NgModule({
        imports: [platform_browser_1.BrowserModule, forms_1.FormsModule, router_1.RouterModule.forRoot(appRoutes), http_1.HttpModule],
        declarations: [Main, Login, Register],
        bootstrap: [Main]
    })
], AppModule);
exports.AppModule = AppModule;
//# sourceMappingURL=app.module.js.map