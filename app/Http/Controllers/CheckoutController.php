<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
use Cart;


session_start();


class CheckoutController extends Controller
{
    public function login_checkout(){
        $category= DB::table('tbl_category_product')->orderBy('category_id','desc')->get();
        $brand= DB::table('tbl_brand')->orderBy('brand_id','desc')->get();
        return view('pages.checkout.login_checkout')->with('category',$category)->with('brand',$brand);

    }
    public function add_customer(Request $request){
        $data=array();
        $data['customer_name']=$request->customer_name;
        $data['customer_phone']=$request->customer_phone;
        $data['customer_email']=$request->customer_email;
        $data['customer_password']=md5($request->customer_password);
      
        $customer_id=DB::table('tbl_customer')->insertGetId($data);

        Session::put('customer_id',$customer_id);
        Session::put('customer_name',$request->customer_name);
        return Redirect('/show-checkout');


    }
    public function checkout(){
        $category= DB::table('tbl_category_product')->orderBy('category_id','desc')->get();
        $brand= DB::table('tbl_brand')->orderBy('brand_id','desc')->get();
        return view('pages.checkout.show_checkout')->with('category',$category)->with('brand',$brand);
       
    }
    public function save_checkout_customer(Request $request){
        $data=array();
        $data['shipping_name']=$request->shipping_name;
        $data['shipping_phone']=$request->shipping_phone;
        $data['shipping_email']=$request->shipping_email;
        $data['shipping_address']=$request->shipping_address;
        $data['shipping_notes']=$request->shipping_notes;

      
        $shipping_id=DB::table('tbl_shipping')->insertGetId($data);

        Session::put('shipping_id',$shipping_id);
        return Redirect('/payment');
        

    }
    public function payment(){
        


    }
    public function logout_checkout(){
        Session::flush();
        return Redirect('/login-checkout');
    }

    public function login_customer(Request $request){ 
        $email=$request->email_account;
        $password=md5($request->password);
        $result=DB::table('tbl_customer')->where('customer_email',$request->email_acccount)->where('customer_password',md5($request->password_account))->first();
        if($result){
            Session::put('customer_id',$result->customer_id);
            return Redirect::to('/show-checkout');
        }
        else{
            return Redirect::to('/login-checkout');
        }

    }
}
