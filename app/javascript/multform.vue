<template>
    <div>
	<div class="row">
	    <div class="col-5">
		<a>品物名</a>
	    </div>
	    <div class="col-2">
		<a>単価(円)</a>
            </div>
	    <div class="col-2">
		<a>個数</a>
            </div>
	</div>
	<div v-for="(list, index) in lists">
	    <div class="form-group">
		<div class="form-row">
		    <div class="col-5">
			<input
			    class="form-control"
			    required="required"
			    multiple="multiple"
			    type="text"
			    name="product_name[]"
			    id="product_name"
			    placeholder="品物名"
			    v-model="list.product_name"
			>
		    </div>
		    <div class="col-2">
			<input
                            class="form-control"
                            required="required"
                            multiple="multiple"
                            type="number"
			    name="price[]"
			    id="price"
			    praceholder="1"
			    v-model="list.price"
                        >
		    </div>
		    <div class="col-2">
                        <input
                            class="form-control"
                            required="required"
                            multiple="multiple"
                            type="number"
                            name="quantity[]"
                            id="quantity"
                            praceholder="個数"
			    v-model="list.quantity"
                        >
                    </div>
		    <div class="col-1">
			<button v-on:click="onDelete(index)"  type="button" class="btn btn-danger">削除</button>
		    </div>
		</div>
	    </div>
	</div>
	<button type="button" v-on:click="onAdd" class="btn btn-success"> 追加</button>
    </div>
</template>


<script>
 export default{
     data: function () {
	return {
	    counter: 1,
	    lists: [
		{
		    id: 1,
		    product_name: "",
		    price: "",
		    quantity: "",
		}
	    ],
	}
     },
     methods: {
	 onDelete(index){
	     this.lists.splice(index, 1);
	 },
	 onAdd(){
	     this.counter += 1
	     this.lists.push({
		 id: this.counter
	     });
	 },
     },
     filters: {
	 item: function(val){
	     return String(val) + "[]"
	 }
     },
     props: ['params','label','type', 'placeholder']
 }
</script>
