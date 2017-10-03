import { Component } from '@angular/core';
import { Headers, URLSearchParams, Http } from '@angular/http';
/*import Httpservice = require("../../service/http.service");
import HttpService = Httpservice.HttpService;*/
import Tokendata = require("../../data/token.data");
import Token = Tokendata.Token;
import Httpservice = require("../../service/http.service");
import HttpService = Httpservice.HttpService;

@Component({
    selector:'login-app',
    templateUrl: 'app/pages/login/login.html',
    providers: [HttpService]
})
export class LoginComponent {
    email: string; 
    password: string;
    state: string = "none";
    message: string;
    constructor(private service: HttpService){}
    signIn(): void {
        if (this.email == null || this.email === "")
           this.setMessage("Email field is empty");
        else if (this.password == null || this.password === "")
            this.setMessage("Password field is empty");
        else {
            let headers = new Headers();
            headers.append('Content-Type', 'application/x-www-form-urlencoded');
            headers.append("Accept", 'application/json');
            let params = new URLSearchParams();
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
    }

    setMessage(text:string):void {
        this.message = text;
        this.state = "block";
    }
    
}
