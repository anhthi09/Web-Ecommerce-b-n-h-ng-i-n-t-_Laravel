<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;
use Session;
use Illuminate\Support\Facades\Redirect;
use Cart;

session_start();
class CartController extends Controller
{
public function save_cart(Request $request){
   $productId= $request->productid_hidden;
   $quantity = $request->qty;
   $product_info = DB::table('tbl_product')->where('product_id',$productId)->first();
 
$data['id']= $product_info->product_id;
$data['qty']=$quantity;
$data['name']=$product_info->product_name;
$data['price']=$product_info->product_price;
$data['weight']=$product_info->product_price;
$data['options']['image']=$product_info->product_image;

Cart::add($data);
return Redirect::to('/show-cart');

     }

     public function show_cart(){
        $category= DB::table('tbl_category_product')->orderBy('category_id','desc')->get();
        $brand= DB::table('tbl_brand')->orderBy('brand_id','desc')->get();
        return view('pages.cart.show_cart')->with('category',$category)->with('brand',$brand);

     }
     public function delete_cart($rowId){
        Cart::update($rowId,0);
        return Redirect::to('/show-cart');


     }
     public function update_cart(Request $request){
        $rowId=$request->rowId_cart;
        $qty=$request->quantity_cart;
      Cart::update($rowId,$qty);
      return Redirect::to('/show-cart');


   }

}
