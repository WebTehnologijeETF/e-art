<!-- ============INDEX========== -->
<div id="el-31" class="row row-70 artworks-container">
	<div id="el-32" class="col col-15 el-32">
	</div>
	<div id="el-33" class="col col-70 el-33">
		<!--
		<div id="el-34" class="row row-15 el-34">
			<div id="el-35" class="col col-25 el-35">
			</div>
			<div id="el-36" class="col col-50 el-36">
				<div id="el-37" class="row row-25 el-37">
				</div>
				<div id="list-title" class="row row-50 text-stroke">
					
				</div>
				<div id="el-39" class="row row-25 el-39">
				</div>
			</div>
			<div id="el-40" class="col col-25 el-40">
			</div>
		</div>
		-->
		<div id="el-41" class="row row-5 el-41">
		</div>
		<!-- =====ARTWORKS=====-->
		<?php
			$file_list = scandir('../novosti');
			$news = array();
			$news_file_names = array();
			
			foreach($file_list as $file) {
				if(!is_dir('../novosti/' . $file)) {
					array_push($news, file('../novosti/' . $file));
					array_push($news_file_names, $file);
				}
			}
			
			// remove previous details filesize
			//$details_files = scandir('/novosti/details');
			
			
			foreach($news as $new) {
				$has_details = FALSE;
				$date_time = htmlspecialchars($new[0], ENT_QUOTES, 'UTF-8');
				$user_name = htmlspecialchars($new[1], ENT_QUOTES, 'UTF-8');
				$title = htmlspecialchars($new[2], ENT_QUOTES, 'UTF-8');
				$image_url = htmlspecialchars($new[3], ENT_QUOTES, 'UTF-8');
				
				$news_text = '';
				$i = 4;
				for(; $i < count($new) && substr($new[$i], 0, 2) != '--'; $i++) {
					$news_text .= $new[$i] . ' ';
				}
				
				//echo 
					//$date_time . ' ' . $user_name . ' ' . $title . ' ' . 
					//$image_url . ' ' . $news_text . "\n";
				
				$details_file_name = '../novosti/details/' . $news_file_names[array_search($new, $news)] . '-details.php';
				
				if($i !== count($new)) {
					++$i;
					$details = 
						'<div id="el-31" class="row row-70 artworks-container">' .
						'<div id="el-32" class="col col-15 el-32">' .
						'</div>' .
						'<div id="el-33" class="col col-70 el-33">' .
						'<div id="el-41" class="row row-5 el-41">' .
						'</div>' .
						'<!-- =====ARTWORKS=====-->' .
							'<div class="col col-99">';
					
					for(; $i < count($new); $i++) {
						$details .= $new[$i] . ' ';
					}

					$details .=
						'<button onclick="loadPage(\'index.php\')">Back</button>';
					
					$details .= 
							'</div>';
					
					$details .=
						'</div>' .
						'<div id="el-58" class="col col-15 el-58">' .
						'</div>' .
						'</div>';
					
					$details_file = fopen($details_file_name, 'w+');
					fwrite($details_file, $details);
					$has_details = TRUE;
				}
				
				echo
					'<!-- ============ARTWORK INSTANCE========== -->' . "\n" .
					'<div class="row row-50 artwork-container">' . "\n" .
						'<div class="col col-1">' . "\n" .
						'</div>' . "\n" .
						'<div class="col col-98">' . "\n" .
							'<div class="row row-5">' . "\n" .
							'</div>' . "\n" .
							'<div class="row row-70">' . "\n" .
								'<div class="col col-75">' . "\n" .
									'<div class="row row-25">' . "\n" .
										'<div class="col col-50 text-stroke artwork-title">' . "\n" .
											$title . "\n" .
										'</div>' . "\n" .
										'<div class="col col-50 el-51 artwork-upload-info">' . "\n" .
											'<div class="row row-75">' . "\n" .
											'</div>' . "\n" .
											'<span class="centered-text row row-25">(by ' . $user_name . ' on ' . $date_time . ')</span>' . "\n" .
										'</div>' . "\n" .
									'</div>' . "\n" .
									'<div class="row row-50 artwork-description">' . "\n" .
										$news_text . "\n" .
									'</div>' . "\n";
									if($has_details === TRUE) {
										echo 
										'<div class="row row-25 artwork-details-link-container">' . "\n" .
											'<a href="#" onclick="loadPage(\'' . $details_file_name . '\')">Details...</a>' . "\n" .
										'</div>' . "\n";
									}								
								echo 
								'</div>' . "\n" .
								
								'<div class="col col-25">' . "\n" .
									'<img alt="slika" src="' . $image_url . '" class="thumbnail-div-pic" />' . "\n" .
								'</div>' . "\n" .
							'</div>' . "\n" .
							'<div class="row row-20 comment-box-container">' . "\n" .
								'<textarea>Leave your comment here...</textarea>' . "\n" .
							'</div>' . "\n" .
							'<div class="row row-5">' . "\n" .
							'</div>' . "\n" .
						'</div>' . "\n" .
						'<div class="col col-1">' . "\n" .
						'</div>' . "\n" .
					'</div>' . "\n" .

					'<div class="row row-5">' . "\n" .
					'</div>' . "\n" .
					'<!-- ============endof ARTWORK INSTANCE========== -->' . "\n";
			}
		?>
		<!-- =====endof ARTWORKS=====-->
		
	</div>
	<div id="el-58" class="col col-15 el-58">
	</div>
</div>
<!-- ============endofINDEX========== -->