<?php

namespace App\Http\Controllers\Admin;

use App\Comment;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CommentController extends Controller
{
    public function index()
    {
        $comments = Comment::latest()->get();
        return view('admin.comments',compact('comments'));
    }

    public function updateStatus(Request $request)
    {
        $comment = Comment::findOrFail($request->id);
        $comment->status = $request->status;
        $comment->save();

        return response()->json(['message' => 'Comment status updated successfully!']);
    }

    public function approval($id)
    {
        $post = Comment::find($id);
        if ($comment->status == false)
        {
            $comment->status = true;
            $comment->save();

            Toastr::success('Post Successfully Approved :)','Success');
        } else {
            $comment->status = false;
            $comment->save();
            Toastr::info('This Post is already approved','Info');
        }
        return redirect()->back();
    }

    public function destroy($id)
    {
        Comment::findOrFail($id)->delete();
        Toastr::success('Comment Successfully Deleted','Success');
        return redirect()->back();
    }
}
