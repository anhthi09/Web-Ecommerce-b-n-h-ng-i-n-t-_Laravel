<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Http\Requests;
use Illuminate\Contracts\Session\Session as SessionSession;
use Session;
use Illuminate\Support\Facades\Redirect;

session_start();


class AdminController extends Controller
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
    public function index()
    {
        return view('admin_login');
    }
    public function show_dashboard()
    {

        $this->AuthLogin();
        return view('admin.dashboard');
    }
    public function dashboard(Request $request)
    {
       
        $admin_email = $request->admin_email;
        $admin_password = md5($request->admin_password);
        $result = DB::table('tbl_admin')->where('admin_email', $admin_email)->where('admin_password', $admin_password)->first();
        if ($result == true) {
            session::put('admin_name', $result->admin_name);
            session::put('admin_id', $result->admin_id);
            return Redirect::to('/dashboard');
        } else {
            session::put('message', 'Mật khẩu hoặc tài khoản không đúng. Vui lòng nhập lại');
            return Redirect::to('/admin');
        }
    }

    public function logout()
    {
        $this->AuthLogin();
        session::put('admin_name', null);
            session::put('admin_id',null);
            return Redirect::to('/admin');

    }
}
