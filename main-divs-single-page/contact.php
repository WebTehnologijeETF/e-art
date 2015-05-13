<script src="scripts/contact.js"></script>

<!-- ===== CONTACT FORM ===== -->
	<div id="el-31" class="row row-60 el-31">
		<div id="el-32" class="col col-25 el-32">
		</div>
		<div id="el-33" class="col col-50 el-33">
			<div id="el-34" class="row row-5 el-34">
			</div>
			<form class="row row-100" onsubmit="return isFormSubmitable();">
			
				<div id="el-35" class="row row-7 text-stroke form-item-title">
					Your email&nbsp;
					<span id="email-error-provider" class="error-message invisible">
						<img class="icon-image" src="images/contact/x.png">
						Not ok.
					</span>
					<span id="email-valid-provider" class="valid-message invisible">
						<img class="icon-image" src="images/contact/tick-mark.jpg">
						Its ok its ok.
					</span>
				</div>
				<div id="el-36" class="row row-5 el-36">
					<input name="email" id="email-input" type="mail" class="contact-input" onblur="validate('email-input', '^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+', 'email-error-provider', 'email-valid-provider', 0);"></input>
				</div>
				
				
				<div id="el-35" class="row row-7 text-stroke form-item-title">
					Your phone number&nbsp;
					<span id="phone-error-provider" class="error-message invisible">
						<img class="icon-image" src="images/contact/x.png">
						Not ok.
					</span>
					<span id="phone-valid-provider" class="valid-message invisible">
						<img class="icon-image" src="images/contact/tick-mark.jpg">
						Its ok its ok.
					</span>
				</div>
				<div id="el-36" class="row row-5 el-36">
					<input name="phone" id="phone-input" type="tel" class="contact-input" onblur="validate('phone-input', '([0-9])+', 'phone-error-provider', 'phone-valid-provider', 0);"></input>
				</div>
				
				
				<div id="el-37" class="row row-7 text-stroke form-item-title">
					Message title&nbsp;
					<span id="message-title-error-provider" class="error-message invisible">
						<img class="icon-image" src="images/contact/x.png">
						Not ok.
					</span>
					<span id="message-title-valid-provider" class="valid-message invisible">
						<img class="icon-image" src="images/contact/tick-mark.jpg">
						Its ok its ok.
					</span>
				</div>
				<div id="el-38" class="row row-5 el-38">
					<input name="message-title" id="message-title-input" class="contact-input"  onblur="validate('message-title-input', '', 'message-title-error-provider', 'message-title-valid-provider', 1);"></input>
				</div>
				
				
				<div class="row row-7 text-stroke form-item-title">
					Message&nbsp;
				</div>
				<div id="el-40" class="row row-20 el-40">
					<textarea name="message" class="contact-input"></textarea>
				</div>
				
				<div class="row row-5 text-stroke form-item-title">
					Mjesto&nbsp;
					<span id="mjesto-error-provider" class="error-message invisible">
						<img class="icon-image" src="images/contact/x.png">
						Not ok.
					</span>
					<span id="mjesto-valid-provider" class="valid-message invisible">
						<img class="icon-image" src="images/contact/tick-mark.jpg">
						Its ok its ok.
					</span>
				</div>
				<div class="row row-5 el-38">
					<input name="mjesto" id="mjesto-input" class="contact-input" onblur="ajaxValidate();"></input>
				</div>
				
				<div class="row row-5 text-stroke form-item-title">
					Postanski broj&nbsp;
					<span id="postanski-broj-error-provider" class="error-message invisible">
						<img class="icon-image" src="images/contact/x.png">
						Not ok.
					</span>
					<span id="postanski-broj-valid-provider" class="valid-message invisible">
						<img class="icon-image" src="images/contact/tick-mark.jpg">
						Its ok its ok.
					</span>
				</div>
				<div class="row row-5 el-38">
					<input name="postanski-broj" id="postanski-broj-input" class="contact-input" onblur="ajaxValidate();"></input>
				</div>
				
				<div class="row row-5 submit-button-container">
					<div class="col col-85">
					</div>
					
					<div class="col col-15">
						<button type="submit" class="contact-submit-button">Send</button>
					</div>					
				</div>
				
			</form>
		</div>
		<div id="el-41" class="col col-25 el-41">
		</div>
	</div>
	<div id="el-42" class="row row-10 el-42">
	</div>
	<!-- ===== endof CONTACT FORM ===== -->