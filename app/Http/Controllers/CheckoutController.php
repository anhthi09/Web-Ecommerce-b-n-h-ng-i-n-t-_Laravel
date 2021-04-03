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
     public function AuthLogin(){
        $admin_id= Session::get('admin_id');
        if($admin_id){
           return redirect::to('admin.dashboard');

        }
        else{
           return redirect::to('admin')->send();
        }
    }
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
         $category= DB::table('tbl_category_product')->orderBy('category_id','desc')->get();
        $brand= DB::table('tbl_brand')->orderBy('brand_id','desc')->get();
        return view('pages.checkout.payment')->with('category',$category)->with('brand',$brand);
        
    }
    public function order_place(Request $request){
        //insert hinh thuc thanh toan
        $data=array();
        $data['payment_method']=$request->payment_option;
        $data['payment_status']='Đang chờ xử lí';
       //Khi insert sẽ lấy id rồi truyền vào payment_id
        $payment_id=DB::table('tbl_payment')->insertGetId($data);
        //insert order
        $o_data=array();
        $o_data['customer_id']=Session::get('customer_id');
        $o_data['shipping_id']=Session::get('shipping_id');
        $o_data['payment_id']=$payment_id;
        $o_data['order_total']=Cart::total();
        $o_data['order_status']='Đang chờ xử lí';
       //Khi insert sẽ lấy id rồi truyền vào payment_id
       $o_id=DB::table('tbl_order')->insertGetId($o_data);
//Insert order detail
//CHI TIET GIO HANG
$content=Cart::content();
foreach($content as $v_content){
$o_d_data=array();
$o_d_data['order_id']=$o_id;
$o_d_data['product_id']=$v_content->id;
$o_d_data['product_name']=$v_content->name;
$o_d_data['product_price']=$v_content->price;
$o_d_data['product_sales_quantity']=$v_content->qty;
DB::table('tbl_order_detail')->insert($o_d_data);
}
       if( $data['payment_method']==1){
           echo 'Thanh toán thẻ ATM';
       }
           else{
               Cart::destroy();//huy phiên giao dịch cũ

               $category= DB::table('tbl_category_product')->orderBy('category_id','desc')->get();
               $brand= DB::table('tbl_brand')->orderBy('brand_id','desc')->get();
               return view('pages.checkout.handcash')->with('category',$category)->with('brand',$brand);

           }
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
    public function manage_order(){
        $this->AuthLogin();
        $all_order = DB::table('tbl_order')
        ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
       ->select('tbl_order.*','tbl_customer.customer_name')->orderby('tbl_order.order_id','desc')->get();

        $manager_order= view('admin.manage_order') -> with('all_order',$all_order);
        return view('admin_layout')->with('admin.manage_order',$manager_order);
    }
     
    public function view_order($orderId){
        $this->AuthLogin();
        $order_by_id = DB::table('tbl_order')
        ->join('tbl_customer','tbl_order.customer_id','=','tbl_customer.customer_id')
        ->join('tbl_shipping','tbl_shipping.shipping_id','=','tbl_order.shipping_id')
        ->join('tbl_order_detail','tbl_order_detail.order_id','=','tbl_order.order_id')
       ->select('tbl_order.*','tbl_customer.*','tbl_shipping.*','tbl_order_detail.*')->first();
        $manager_order_by_id= view('admin.view_order') -> with('order_by_id',$order_by_id);
        return view('admin_layout')->with('admin.view_order',$manager_order_by_id);
    }
}
