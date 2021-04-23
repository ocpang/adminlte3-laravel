<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Customer extends Model
{
    use SoftDeletes;
    public $incrementing = false;

    protected $fillable = ['id', 'name', 'trunk_id', 'domain_id', 'server_id', 'label', 'ref_id', 'status', 
    'user_created', 'user_updated', 'user_deleted', 'created_at', 'updated_at', 'deleted_at'];

    public function server()
    {
        return $this->belongsTo('App\Models\Server');
    }

    public function domain()
    {
        return $this->belongsTo('App\Models\Domain');
    }

    public function trunk()
    {
        return $this->belongsTo('App\Models\Trunk');
    }

    public function cidnums()
    {
        return $this->hasMany('App\Models\Cidnum');
    }
    
    public function pstnnums()
    {
        return $this->hasMany('App\Models\Pstnnum');
    }
    
    public function mohs()
    {
        return $this->hasMany('App\Models\Moh');
    }

    public function outgoings()
    {
        return $this->hasMany('App\Models\Outgoing');
    }
    
    public function sipusers()
    {
        return $this->hasMany('App\Models\Sipuser');
    }

    public function timecalls()
    {
        return $this->hasMany('App\Models\Timecall');
    }
    
}
