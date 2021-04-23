<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->uuid('id');
            $table->primary('id');
            $table->string('name', 100)->nullable();
            $table->string('label', 100)->nullable();
            $table->tinyInteger('status')->nullable()->default(0);
            $table->unsignedInteger('user_created')->nullable()->default(0);
            $table->unsignedInteger('user_updated')->nullable()->default(0);
            $table->unsignedInteger('user_deleted')->nullable()->default(0);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
}
