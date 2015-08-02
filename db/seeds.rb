# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create_table "resumes", force: :cascade do |t|
#     t.string   "name"
#     t.string   "email"
#     t.string   "phone"
#     t.string   "resume_name"
#     t.string   "profile"
#     t.string   "pdf_file_name"
#     t.string   "pdf_content_type"
#     t.integer  "pdf_file_size"
#     t.datetime "pdf_updated_at"
#     t.string   "txt_file_name"
#     t.string   "txt_content_type"
#     t.integer  "txt_file_size"
#     t.datetime "txt_updated_at"
#     t.string   "docx_file_name"
#     t.string   "docx_content_type"
#     t.integer  "docx_file_size"
#     t.datetime "docx_updated_at"
#     t.datetime "created_at",        null: false
#     t.datetime "updated_at",        null: false
#   end

Resume.destroy_all
Link.destroy_all
Experience.destroy_all
Demonstration.destroy_all

seed_txt = File.open('/Users/devankestel1/Documents/resumany/app/assets/txt/seed.txt')
seed_pdf = File.open('/Users/devankestel1/Documents/resumany/app/assets/pdf/seed.pdf')
seed_docx = File.open ('/Users/devankestel1/Documents/resumany/app/assets/docx/seed.docx')

# new lesson: excitedly create thigns so we get real errors!

my_resume = Resume.create!(name: "Devan E. Kestel",
                          resume_name: "cv",
                          email: "devan.kestel@gmail.com",
                          phone: "617.233.2629",
                          profile: "If I had one of these worked up, it would be a paragraph telling you about me. It would also contain some objective statement garbage. I'm going to keep typing things to make this feel more like a paragraph in terms of length. Yes, I will always be too lazy to go grab some lorem ipsum when I need it. There, I think we are about at the right length.",
                          pdf: seed_pdf,
                          txt: seed_txt,
                          docx: seed_docx)

seed_txt.close
seed_pdf.close
seed_docx.close

puts my_resume.name
puts my_resume.email
puts my_resume.profile
puts my_resume.phone
puts my_resume.resume_name
puts my_resume.id

# create_table "links", force: :cascade do |t|
#     t.string   "url"
#     t.string   "title"
#     t.integer  "resume_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

github = my_resume.links.create(title: "Github",
                                url: "http://www.github.com/devankestel")

twitter = my_resume.links.create(title: "Twitter",
                                url: "http://www.twitter.com/devankestel")

tumblr = my_resume.links.create(title: "Tumblr",
                                url: "http://devankestel.tumblr.com")

puts github.title
puts github.url
puts github.id


# create_table "experiences", force: :cascade do |t|
#     t.string   "title"
#     t.string   "description"
#     t.string   "organization"
#     t.integer  "start_month"
#     t.integer  "start_year"
#     t.integer  "end_month"
#     t.integer  "end_year"
#     t.string   "category"
#     t.string   "city"
#     t.string   "state_or_country"
#     t.boolean  "present",          default: false
#     t.integer  "resume_id"
#     t.datetime "created_at",                       null: false
#     t.datetime "updated_at",                       null: false
#   end

iron_yard = my_resume.experiences.create!(title: "Rails Engineering",
                                             organization: "The Iron Yard",
                                             city: "Orlando",
                                             state_or_country: "FL",
                                             category: "education",
                                             present: true,
                                             end_month: 8,
                                             end_year: 2015)

notre_dame = my_resume.experiences.create!(title: "M.S. in Chemical and Biomolecular Engineering",
                                             organization: "University of Notre Dame du Lac",
                                             city: "Notre Dame",
                                             state_or_country: "IN",
                                             category: "education",
                                             description: "Thermodynamic Research of Ionic Liquids Group (ThRILs)
                                             Adviser: Dr. Joan Brennecke",
                                             end_month: 5,
                                             end_year: 2010)
mit = my_resume.experiences.create!(title: "B.S. in Chemical Engineering, minor in Spanish",
                                             organization: "Massachusetts Institute of Technology",
                                             city: "Cambridge",
                                             state_or_country: "MA",
                                             category: "education",
                                             description: "All chemical engineering courses relied heavily upon MATLAB and data science principles. Other relevant course: Intro to Python.",
                                             end_month: 6,
                                             end_year: 2007)

axalta = my_resume.experiences.create!(title: "Senior Chemical Engineer",
                                             organization: "Dupont Performance Coatings
                                             (Now Axalta Coatings Systems)",
                                             city: "Mt. Clemens",
                                             state_or_country: "MI",
                                             category: "paid",
                                             start_month: 2,
                                             start_year: 2011,
                                             end_month: 4,
                                             end_year: 2015)

nd_research = my_resume.experiences.create!(title: "Graduate Research Assistant",
                                             organization: "University of Notre Dame du Lac",
                                             city: "Notre Dame",
                                             state_or_country: "IN",
                                             category: "paid",
                                             start_month: 10,
                                             start_year: 2007,
                                             end_month: 3,
                                             end_year: 2010)

alltech = my_resume.experiences.create!(title: "Chemical Engineering Intern",
                                             organization: "Alltech, Inc.",
                                             city: "Nicholasville",
                                             state_or_country: "KY",
                                             category: "paid",
                                             start_month: 6,
                                             start_year: 2004,
                                             end_month: 8,
                                             end_year: 2006)

skills = my_resume.experiences.create!(category: "skill")

puts iron_yard.organization
puts iron_yard.title
puts iron_yard.city
puts iron_yard.state_or_country
puts iron_yard.category
puts iron_yard.present
puts iron_yard.end_year

# create_table "demonstrations", force: :cascade do |t|
#     t.string   "description"
#     t.boolean  "core",          default: false
#     t.string   "subset"
#     t.string   "category"
#     t.string   "display"
#     t.string   "cert"
#     t.integer  "experience_id"
#     t.datetime "created_at",                    null: false
#     t.datetime "updated_at",                    null: false
#   end

# suggestion for how to seed acts-as-taggable-on
# product.tag_list.add "tag1", "tag2"
# product.save

axalta_b1 = axalta.demonstrations.create!(description: "Product formulation, optimization, and technical support of solventborne and waterborne automotive coatings for General Motors accounts with revenue exceeding $30MM annually.",
                                          category: "accomplishment",
                                          core: true)
axalta_b2 = axalta.demonstrations.create!(description: "Optimized, commercialized, and launched a two­-component, polyurethane clearcoat system which delivered $800M revenue growth in 2012.",
                                          category: "accomplishment",
                                          tag_list: "engineering, financial")
axalta_b3 = axalta.demonstrations.create!(description: "Developed new rheology test method with optimized shear profile, reducing error in measurement by 50%, for non­-Newtonian solventborne paint systems.",
                                          category: "accomplishment",
                                          tag_list: "engineering")
axalta_b4 = axalta.demonstrations.create!(description: "Technical lead for innovative spray process and paint technology conversion program which minimized assembly line downtime by 50% over conventional conversion.",
                                          category: "accomplishment",
                                          tag_list: "leadership, engineering")
axalta_b5 = axalta.demonstrations.create!(description: "Provided support to Arlington Assembly, GM's most profitable manufacturing site, via new color development, formulation adjustments, and troubleshooting line issues (2011-2013). Currently provide support to Bowling Green Assembly, home of the Corvette.",
                                          category: "accomplishment",
                                          tag_list: "engineering, chemistry, production")
axalta_b6 = axalta.demonstrations.create!(description: "In addition to research and development, interface with manufacturing, quality assurance, sales and marketing, product stewardship, and field account teams on a daily basis.",
                                          category: "accomplishment",
                                          core: true)
axalta_b7 = axalta.demonstrations.create!(description: "Work in a high­pressured, multi­tasking environment with constantly changing priorities and frequently required to make \"on the spot\" decisions that directly impact manufacturing at both Axalta and GM sites.",
                                          category: "accomplishment",
                                          core: true)
axalta_b8 = axalta.demonstrations.create!(description: "Align formulas, manufacturing procedures, and product design specifications for manufacturing scale­-up.",
                                          category: "accomplishment",
                                          tag_list: "chemistry, engineering, production")
axalta_b9 = axalta.demonstrations.create!(description: "Serve on site team of internal quality auditors. Audit 6 areas per year against ISO:9001 and TS­16949 standards. Interview exempt and non­exempt employees across all shifts.",
                                          category: "accomplishment",
                                          tag_list: "quality_management")
nd_b1 = nd_research.demonstrations.create!(description: "Thermophysical property measurement and estimation of ionic liquid systems for use as environmentally benign working fluids for carbon dioxide capture.",
                                          category: "accomplishment",
                                          core: true)
nd_b2 = nd_research.demonstrations.create!(description: "Worked in a hybrid experimental and computational team to rapidly screen and characterize candidate ionic liquids for process optima including: relative volatility and solubility, hydrophobicity, corrosivity, toxicity, reaction and absorption enthalpies, and others properties relevant to process scale­up.",
                                          category: "accomplishment",
                                          core: true)
nd_b3 = nd_research.demonstrations.create!(description: "Gravimetric measurement of binary vapor­-liquid equilibrium curves of ionic liquids with components in flue gas (e.g. CO2, CH4, H2O) as well as N2O.",
                                          category: "accomplishment",
                                          tag_list: "thermodynamics, laboratory")
nd_b4 = nd_research.demonstrations.create!(description: "Analyzed and calculated hysteresis, infinite dilution activity coefficients, Henry's Law constants, and deconvolution of physical CO2 solubility from chemical CO2 reaction in amine­-functionalized ionic liquid systems.",
                                          category: "accomplishment",
                                          tag_list: "chemistry, engineering, thermodynamics")
nd_b5 = nd_research.demonstrations.create!(description: "Supervised design and construction of ionic liquid absorber/ stripper unit.",
                                          category: "accomplishment",
                                          tag_list: "leadership, engineering")
nd_b6 = nd_research.demonstrations.create!(description: "Proficient with both high and low pressure systems.",
                                          category: "accomplishment",
                                          tag_list: "engineering")
alltech_b1 = alltech.demonstrations.create!(description: "Product development, process design, and pilot plant management for Optigen, a controlled­-release, non­protein nitrogen supplement for dairy cattle which is now commercialized.",
                                          category: "accomplishment",
                                          core: true)
alltech_b2 = alltech.demonstrations.create!(description: "Facilitated formulation of controlled­-release coating.",
                                          category: "accomplishment",
                                          tag_list: "chemistry")
alltech_b3 = alltech.demonstrations.create!(description: "Authored process flow diagrams. Collaborated on design of specialized fluidized bed dryer. Designated process instrumentation for final scale­up.",
                                          category: "accomplishment",
                                          tag_list: "engineering")
alltech_b4 = alltech.demonstrations.create!(description: "Supervised 3­-4 production workers per shift in pilot plant operations.",
                                          category: "accomplishment",
                                          tag_list: "leadership")
alltech_b5 = alltech.demonstrations.create!(description: "Designed and formulated a novel filtration system capable of 100% toxin removal from contaminated liquids.",
                                          category: "accomplishment")
alltech_b6 = alltech.demonstrations.create!(description: "Bottled beer (KY Ale, KY Light, KY Bourbon Barrel Ale) at company microbrewery.",
                                          category: "accomplishment",
                                          tag_list: "beer, fun, stuff")

skills_l1 = skills.demonstrations.create!(display: "list",
                                          subset: "Programming",
                                          description: "Ruby, Rails, JS, HTML5, CSS3, MATLAB, C++, Python",
                                          core: true)
skills_p1 = skills.demonstrations.create!(display: "paragraph",
                                          subset: "Javascript",
                                          description: "Here is where I talk about all the fancy Codeschool courses I took and badges I earned. In paragraph format. So this has to be long like sentences and stuff. There you go.",
                                          core: true)
skills_l1 = skills.demonstrations.create!(display: "list",
                                          subset: "Certifications",
                                          description: "Certified Beer Server, RABSQA Lead Internal Quality Auditor, Six Sigma Greenbelt",
                                          core: true)
skills_p1 = skills.demonstrations.create!(display: "paragraph",
                                          subset: "Spanish",
                                          description: "Here is where I blather about my fancy study abroad in Madrid that lasted six months where I took lots of courses and did lots of things. Fluency in a foreign language is cool and should count for something.",
                                          core: true) 




puts axalta_b1.description
puts axalta_b1.core
puts axalta_b1.id




