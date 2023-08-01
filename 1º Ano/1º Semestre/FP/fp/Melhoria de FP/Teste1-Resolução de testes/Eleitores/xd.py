		l/2	
		#######################################################todos iguais		
		elif d == r and d==l and r==l:
			
			if dep_r < dep_d < dep_l:
				dep_r+=1
				dep-=1
				r/2
			elif dep_d < dep_r < dep_l:	
				dep_d+=1
				dep-=1
				d/2
			elif dep_l < dep_r < dep_d:
				dep_l+=1
				dep-=1
				l/2
			else:
				a= randint(1,3)
				if a==1:
					dep_l+=1
					dep-=1
					l/2
				elif a==2:
					dep_d+=1
					dep-=1
					d/2
				else:
					dep_r+=1
					dep-=1
					r/2
					
					
		######################################################uns iguais e outros diferentes
		elif d == r and d>l:
			if dep_d < dep_r:
				dep_d+=1
				dep-=1
				d/2
			else:
				dep_r+=1
				dep-=1
				r/2
		elif d == l and d>r:
			if dep_d < dep_l:
				dep_d+=1
				dep-=1
				d/2
			else:
				dep_l+=1
				dep-=1
				l/2
		elif r == l and d<r:
			if dep_r < dep_l:
				dep_r+=1
				dep-=1
				r/2
			else:
				dep_r+=1
				dep-=1
				r/2
			
