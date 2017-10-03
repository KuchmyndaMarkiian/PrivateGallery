import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import {Routes,RouterModule} from '@angular/router'

import mainComponent = require("./main.component");
import Main = mainComponent.MainComponent;
import loginComponent = require("./pages/login/login.component");
import Login = loginComponent.LoginComponent;
import registerComponent = require("./pages/register/register.component");
import Register = registerComponent.RegisterComponent;

const appRoutes: Routes = [
    { path: '', component: Main },
    { path: 'login', component: Login },
    {path: 'register', component: Register}
];

@NgModule({
    imports: [BrowserModule, FormsModule, RouterModule.forRoot(appRoutes), HttpModule],
    declarations: [Main, Login, Register],
    bootstrap: [Main]
})
export class AppModule { }