# To test this out:
 - clone project
 - run `rails s` inside of rails_ajax/ajax_request/
 - run `rails s -p3001` inside of rails_ajax/ajax_response/
 - load http://localhost:3000, inspect element and look at your javascript console for the ajax response

# In short, you'll need to do the following for your project:
## Request app (where you AJAX call is located)

  //You'll need to have something like-so:
  $(function(){
    $.ajax({
      url:'YOUR URL', // Where to make request
      type: 'POST', // HTTP method: "POST" or "GET"
      data:{}, // Object with data to send to the server resource
      dataType: 'jsonp', // Expected return data: xml, html, text, json, script, or jsonp
      success: function(resp){ // Function triggered on successful ajax (with response data argument)
        console.log('SUCCESS!!!');
        console.log(resp);
      },
      error: function(){ // Function triggered on error or timeout
        console.log('ERROR!!!');
      },
      complete: function(){ // Function always triggered after return
        console.log('Completed');
      }
    });
  });


## Response app (the server where you're sending a response back)

  //Inside of the controller you're AJAX is hitting
  //Add to top of controller
  skip_before_filter :verify_authenticity_token, :only => [:method_name]

  //Then for the method, make sure it's something like this:
  def method_name
    respond_to do |format|
      format.js { render json: {success: 1, message: ''}, :callback => params[:callback] }
    end
  end

---
