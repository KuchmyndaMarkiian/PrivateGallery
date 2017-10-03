import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import {Routes,RouterModule} from '@angular/router'

import mainComponent = require("./main.component");
import Main = mainComponent.MainComponent;
import loginComponent = require("./pages/login.component");
import Login = loginComponent.LoginComponent;

const appRoutes: Routes = [
    { path: '', component: Main },
    { path: 'login', component: Login}];

@NgModule({
    imports: [BrowserModule, FormsModule, RouterModule.forRoot(appRoutes)],
    declarations: [Main, Login],
    bootstrap: [Main]
})
export class AppModule { }