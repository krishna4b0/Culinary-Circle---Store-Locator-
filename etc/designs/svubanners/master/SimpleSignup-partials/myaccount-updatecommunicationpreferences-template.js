<div class="ss-updatecommunicationpreferences-container ss-inner-container ss-alt-container">
  <a href="#" class="ss-close-button"></a>
  <div class="ss-login-inline-error ss-entry-inline-error">
    <a href='#' class="ss-prevent-default"></a>
    <p></p>
  </div>
  <div class="communication-preferences-container">
    <h2>Communication Preferences</h2>
    <form id="ss-signup-form">
      <p>How would you like to receive offers and other communications from Cub?</p>
      <ul class="comm-prefs <% if (ssTemplate.isAssociate) { %>associateCommPref<% } %>">
        <li>
          <div class="currentCommPref">
            <label>
              <input type="checkbox" id="checkIfEmail" checked>						
              Email
            </label>
          </div>
          <div class="currentCommPrefValue" id="currentCommEmail">
            <label><span>*</span>Preferred Email</label>
            <input type="text" data-validation="email" value="<%= ssTemplate.currentEmail %>"/>
            <p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>
          </div>
        </li>
        <li>
          <div class="currentCommPref">
            <label>
              <input type="checkbox" id="checkIfSMS" checked>
              SMS (text messages)
            </label>
          </div>
          <div class="currentCommPrefValue" id="currentCommSMS">
            <label><span>*</span>Mobile Phone Number</label>
            <% if (ssTemplate.isAssociate) { %>
            <div>
              (<%= ssTemplate.currentAreaCode %>)-<%= ssTemplate.currentPhone3 %>-<%= ssTemplate.currentPhone4 %>

              <div class="associateMessage">Associate contact information can be updated through MIO or your HR System.</div>

            </div>
            <% } else { %>

            <input type="text" id="phoneAreaCode" data-validation="characters3" maxlength="3" class="input3digit" value="<%= ssTemplate.currentAreaCode %>"/><p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>
            - <input type="text" id="phone3" data-validation="characters3" maxlength="3" class="input3digit" value="<%= ssTemplate.currentPhone3 %>"/><p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>
            - <input type="text" id="phone4" data-validation="characters4" maxlength="4" class="input4digit" value="<%= ssTemplate.currentPhone4 %>"/><p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>
            <% } %>            
          </div>
        </li>
        <li>
          <div class="currentCommPref" >
            <label>
              <input type="checkbox" id="checkIfMail" checked>
              Direct Mail
            </label>
          </div>
          <div class="currentCommPrefValue" id="currentCommMail">

            <div class="showExistingAddress">
              <input type='text' id='fixAddressValidation' style="display:none;" data-validation="alpha" value="<%- ssTemplate.currentFirstName %>"/>
              <div><span id="currentFirstName" ><%- ssTemplate.currentFirstName %></span> <span id="currentLastName"><%- ssTemplate.currentLastName %></span></div>
              <div><span id="currentStreet"><%- ssTemplate.currentStreet %></span> <span id="currentApt"><%- ssTemplate.currentApt %></span>
              </div>
              <div><span id="currentCity"><%- ssTemplate.currentCity %></span>, <span id="currentState"><%- ssTemplate.currentState %></span> <span id="currentZip"><%- ssTemplate.currentZip %></span></div>
              <% if (ssTemplate.isAssociate) { %>
                <div class="associateMessage">Associate contact information can be updated through MIO or your HR System.</div>
              <% } %>
            </div>

            <div class="showAddAddress" style="display:none;">
              <a class="ss-edit-address" href="#">Enter Mailing Address <span class="no-underline">&raquo;</span></a>
            </div>

          </div>

          <% if (!ssTemplate.isAssociate) { %>
          <div id="editAddress"><a class="ss-edit-address" href="#">Edit</a></div>
          <% } %>

        </li>
      </ul>
      <button class="ss-submit-button ss-update-communication-preferences ss-submit-button-disabled" type="submit">Save</button>
      <div class="ss-loading-container">
        <img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
        <span>Updating your profile&hellip;</span>
      </div>
    </form>
  </div>











  <div class="communication-address-container" style="display: none;">
    <h2>Edit Address</h2>
    <form id="ss-signupoverlay-form" class="ss-popup-anchor edit-address">
      <div class="ss-signup-input-container ss-signup-firstname-container ss-popup-anchor first-name">
        <label><span>* </span>First name</label>
        <input spellcheck="false" id="ss-signup-firstname" data-validation="firstname" value="<%- ssTemplate.currentFirstName %>">
        <p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>
      </div>

      <div class="ss-signup-input-container ss-signup-lastname-container last-name ss-popup-anchor">
        <label for="ss-signup-lastname"><span>* </span>Last name</label>
        <input spellcheck="false" id="ss-signup-lastname" data-validation="alphadash" value="<%- ssTemplate.currentLastName %>">
        <p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>
      </div>

      <div class="ss-signup-input-container street-address ss-signup-address-container ss-popup-anchor">
        <label for="address1"><span>* </span>Address</label>
        <input spellcheck="false" id="address1" data-validation="address" value="<%- ssTemplate.currentStreet %>">	
        <p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>              					
      </div>

      <div class="ss-signup-input-container ss-signup-apt-container apt ss-popup-anchor">
        <label for="address2">Apt/Suite</label>
        <input spellcheck="false" id="address2" class="ss-validation-not-required" data-validation="address" value="<%- ssTemplate.currentApt %>">				
        <p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>                      
      </div>

      <div class="ss-signup-input-container city ss-signup-city-container ss-popup-anchor">
        <label for="city"><span>* </span>City</label>
        <input spellcheck="false" id="city" data-validation="city" value="<%- ssTemplate.currentCity %>">
        <p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>							
      </div>

      <div class="ss-signup-input-container state ss-signup-state-container">
        <label for="state"><span>* </span>State</label>
        <select id="state" data-validation="alpha" data-maxlength="2">
          <option value=""></option>
          <option value="AL">AL</option>
          <option value="AK">AK</option>
          <option value="AZ">AZ</option>
          <option value="AR">AR</option>
          <option value="CA">CA</option>
          <option value="CO">CO</option>
          <option value="CT">CT</option>
          <option value="DE">DE</option>
          <option value="DC">DC</option>
          <option value="FL">FL</option>
          <option value="GA">GA</option>
          <option value="HI">HI</option>
          <option value="ID">ID</option>
          <option value="IL">IL</option>
          <option value="IN">IN</option>
          <option value="IA">IA</option>
          <option value="KS">KS</option>
          <option value="KY">KY</option>
          <option value="LA">LA</option>
          <option value="ME">ME</option>
          <option value="MD">MD</option>
          <option value="MA">MA</option>
          <option value="MI">MI</option>
          <option value="MN">MN</option>
          <option value="MS">MS</option>
          <option value="MO">MO</option>
          <option value="MT">MT</option>
          <option value="NE">NE</option>
          <option value="NV">NV</option>
          <option value="NH">NH</option>
          <option value="NJ">NJ</option>
          <option value="NM">NM</option>
          <option value="NY">NY</option>
          <option value="NC">NC</option>
          <option value="ND">ND</option>
          <option value="OH">OH</option>
          <option value="OK">OK</option>
          <option value="OR">OR</option>
          <option value="PA">PA</option>
          <option value="RI">RI</option>
          <option value="SC">SC</option>
          <option value="SD">SD</option>
          <option value="TN">TN</option>
          <option value="TX">TX</option>
          <option value="UT">UT</option>
          <option value="VT">VT</option>
          <option value="VA">VA</option>
          <option value="WA">WV</option>
          <option value="WI">WI</option>
          <option value="WY">WY</option>
        </select>
      </div>

      <div class="ss-signup-input-container zip-code ss-signup-zipcode-container ss-popup-anchor">
        <label for="zip"><span>* </span>Zip code</label>
        <input id="zip" data-validation="characters5" maxlength="5" value="<%- ssTemplate.currentZip %>">
        <p class="ss-invalid-email-popup ss-popup-box ss-popup-low"></p>	
      </div>


    </form>

    <button class="ss-submit-button ss-communication-preferences-address-btn ss-submit-button-disabled" type="submit">Save</button>
    <a href="#" class="ss-back">Go Back</a>
    <div class="ss-loading-container">
      <img src="/etc/designs/svubanners/master/img/simplesignup/ajax-loader.gif">
      <span>Updating your address&hellip;</span>
    </div>
  </div>
</div>