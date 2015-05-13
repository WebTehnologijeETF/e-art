<!-- ==== TABLES ==== -->
	<div id="el-31" class="row row-70 el-31">
		<div id="el-32" class="col col-15 el-32">
			left
		</div>
		
		<div id="el-33" class="col col-70 el-33">
			<div class="col col-20">
			</div>
	
			<div class="col col-60">
				
				<form onsubmit="return false;">
					<!-- NAZIV PROIZVODA -->
					<div class="row row-5 text-stroke form-item-title">
						Naziv proizvoda&nbsp;
						<span id="naziv-error-provider" class="error-message invisible">
							<img class="icon-image" src="images/contact/x.png">
							Not ok.
						</span>
						<span id="naziv-valid-provider" class="valid-message invisible">
							<img class="icon-image" src="images/contact/tick-mark.jpg">
							Its ok its ok.
						</span>
					</div>
					<div class="row row-3 el-36">
						<input name="naziv" id="naziv-input" type="mail" class="contact-input" onblur="validate('naziv-input', '', 'naziv-error-provider', 'naziv-valid-provider', 1);"></input>
					</div>
					<!-- endof NAZIV PROIZVODA -->
					
					<!-- OPIS PROIZVODA -->
					<div class="row row-5 text-stroke form-item-title">
						Opis&nbsp;
						<span id="opis-error-provider" class="error-message invisible">
							<img class="icon-image" src="images/contact/x.png">
							Not ok.
						</span>
						<span id="opis-valid-provider" class="valid-message invisible">
							<img class="icon-image" src="images/contact/tick-mark.jpg">
							Its ok its ok.
						</span>
					</div>
					<div class="row row-3 el-36">
						<input name="opis" id="opis-input" type="mail" class="contact-input" onblur="validate('opis-input', '', 'opis-error-provider', 'opis-valid-provider', 1);"></input>
					</div>
					<!-- endof OPIS PROIZVODA -->
					
					<!-- URL SLIKE PROIZVODA -->
					<div class="row row-5 text-stroke form-item-title">
						URL slike&nbsp;
						<span id="slika-error-provider" class="error-message invisible">
							<img class="icon-image" src="images/contact/x.png">
							Not ok.
						</span>
						<span id="slika-valid-provider" class="valid-message invisible">
							<img class="icon-image" src="images/contact/tick-mark.jpg">
							Its ok its ok.
						</span>
					</div>
					<div class="row row-3 el-36">
						<input name="slika" id="slika-input" type="mail" class="contact-input" onblur="validate('slika-input', '', 'slika-error-provider', 'slika-valid-provider', 1);"></input>
					</div>
					<!-- endof URL SLIKE PROIZVODA -->
					
					<!-- BUTTON -->
					<div class="row row-7 submit-button-container">
						<div class="col col-85">
						</div>
						
						<div class="col col-15">
							<button class="contact-submit-button" onclick="addFromForm();">Add item</button>
						</div>					
					</div>
					<!-- endof BUTTON -->
				</form>
				
				<div class="row row-3">
				</div>
				
				<!-- BUTTON -->
					<div class="row row-3 submit-button-container">
						<div class="col col-85">
						</div>
						
						<div class="col col-15">
							<button class="contact-submit-button" onclick="getAllItemsFromForm();">Update all items</button>
						</div>					
					</div>
					<!-- endof BUTTON -->
				
				<div class="row row-5">
					
					<div class="col col-25">
						Naziv
					</div>
					
					<div class="col col-25">
						Opis
					</div>
					
					<div class="col col-25">
						Slika
					</div>
					
					
				</div>
				
				<div id="table" class="row row-100">
				</div>
				
			</div>
			
			<div class="col col-20">
			</div>

		</div>
		
		<div id="el-42" class="col col-15 el-42">
			right
		</div>
	</div>
	<!-- ==== endof TABLES ==== -->