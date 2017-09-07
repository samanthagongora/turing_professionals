// join table for industry and technology (like tech stacks but with industry instead of company)
// api endpoint with query param/input of industry name
// sideways bar chart of each industry with number of companies using each technology

// for each industry, we need to know: how many companies are using each technology
// so we need: list of industries, list of companies for each industry, list of technologies for each company
// join table with industry id, company id, technology id
// company_industries has company id, industry id
// tech_stacks has company id, technology id
// company_industries has_many tech_stacks
// join company_industries with tech_stacks on company id
// select everything with the same industry id as the industry found by id from query name
// group by technology name and company count
