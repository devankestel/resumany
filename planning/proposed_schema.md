Proposed Schema

  Models and Relations 

    Resume
      has_many experiences
      has_many demonstrations through experiences
      has_many links

    Link
      belongs_to resume

    Experience
      belongs_to resume
      has_many demonstrations

    Demonstration
      belongs_to experience

  Schema (* = optional parameter or piece of parameter)

    Resume

      resume_name:string (name for resume route and downloadable files) (AS INDEX?!)
      name:string (name of applicant)
      email:string (e-mail of applicant)
      phone:string (phone number of applicant)
      profile:string (paragraph describing applicant's personal traits and job objective*)
      pdf:attachment (pdf file attachment of resume)
      txt:attachment (txt file attachment of resume)
      docx:attachment (docx file attachment of resume)

    Link

      url:string (url of social media, portfolio, or website link)
      title:string (text that will be associated with link. ex: "My Portfolio", "Github", "Twitter")
      resume_id:integer (belongs_to resume)

    Experience

      title:string (job title, student major, or similar)
      description:string (additional text describing position*)
      organization:string (school, volunteer org, business, etc.)
      start_month:integer (month* experience started, null if experience is type "education")
      start_year:integer (year experience started, null if is type "education")
      end_month:integer (month* experience ended)
      end_year:integer (year experience ended)
      category:string (education, volunteer, paid, skills, or other applicant specified category)
      city:string (city where organization is based)
      state_or_country:string (state or country, if not in the US, where organization is based)
      present:boolean (true if experience is current, defaults to false)
      resume_id:integer (belongs_to resume)

    Demonstration

      description:string (bullet point text)
      core:boolean (true if demonstration should ALWAYS be included in generated subset resumes)
      category:string (skill, accomplishment, or milestone (actual form input might be radio button))
      tags:taggable (user generated tags categorizing demonstration, ex: "project management", "leadership", "computer science", etc.)
      subset:string (null unless of type skill or other, otherwise user described, ex: "programming", "software", etc.)
      cert:string (null unless of type milestone, otherwise user described certification body, ex: "Cicerone Program", "RABSQA", "The Iron Yard", etc.)
      experience_id:integer (belongs_to experience)



