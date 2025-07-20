-- buildig
INSERT INTO Education.Building (name, location) VALUES
('Materials Engineering', 'Building A, 1st Floor'),
('Mining Engineering', 'Building A, 2nd Floor'),
('Industrial Engineering', 'Building B, 1st Floor'),
('Chemical Engineering', 'Building B, 2nd Floor'),
('Mechanical Engineering', 'Building C, Main Floor'),
('Civil Engineering', 'Building D, Main Floor'),
('Electrical and Computer Engineering', 'Building E, 1st and 2nd Floors'),
('Mathematical Sciences', 'Building F, 3rd Floor'),
('Physics', 'Building F, 4th Floor'),
('Chemistry', 'Building G, 1st Floor'),
('Transportation Engineering', 'Building H, Ground Floor'),
('Training Workshops', 'Technical Building, West Wing'),
('English Language Center', 'Languages Building, 2nd Floor'),
('Islamic Teaching', 'Humanities Building, 1st Floor'),
('Physical Education', 'Sports Complex'),
('Textile Engineering', 'Building I, 1st Floor'),
('Agriculture', 'Agricultural Faculty Building'),
('Natural Resources', 'Natural Resources Building');
GO

---------------------------------------------------------------------------------------------------

-- semester
INSERT INTO Education.Semester (term, year, start_date, end_date) VALUES
-- Year 2022
('Fall', 2022, '2022-09-22', '2023-01-20'),
-- Year 2023
('Spring', 2023, '2023-02-05', '2023-06-20'),
('Fall', 2023, '2023-09-23', '2024-01-22'),
-- Year 2024
('Spring', 2024, '2024-02-06', '2024-06-21'),
('Fall', 2024, '2024-09-22', '2025-01-20'),
-- Year 2025
('Spring', 2025, '2025-02-04', '2025-06-20'),
--year 2021
('Fall', 2021, '2021-09-22', '2022-01-20'),
('Spring', 2022, '2022-02-05', '2022-06-20');
GO

---------------------------------------------------------------------------------------------------

-- depatment
INSERT INTO Education.Department (name, building_id) VALUES
('Materials Engineering', 1),
('Mining Engineering', 2),
('Industrial Engineering', 3),
('Chemical Engineering', 4),
('Mechanical Engineering', 5),
('Civil Engineering', 6),
('Electrical and Computer Engineering', 7),
('Mathematical Sciences', 8),
('Physics', 9),
('Chemistry', 10),
('Transportation Engineering', 11),
('Training Workshops', 12),
('English Language Center', 13),
('Islamic Teaching', 14),
('Physical Education', 15),
('Textile Engineering', 16),
('Agriculture', 17),
('Natural Resources', 18);
GO

---------------------------------------------------------------------------------------------------

-- room
INSERT INTO Education.Room (building_id, room_number, capacity) VALUES
-- Rooms for Materials Engineering (Building ID: 1)
(1, 'MAT-101', 50),
(1, 'MAT-LabA', 25),

-- Rooms for Mining Engineering (Building ID: 2)
(2, 'MIN-101', 45),
(2, 'MIN-LabA', 20),

-- Rooms for Industrial Engineering (Building ID: 3)
(3, 'IND-201', 60),
(3, 'IND-202', 60),

-- Rooms for Chemical Engineering (Building ID: 4)
(4, 'CHE-101', 50),
(4, 'CHE-LabA', 30),
(4, 'CHE-LabB', 30),

-- Rooms for Mechanical Engineering (Building ID: 5)
(5, 'MEC-101', 70),
(5, 'MEC-102', 70),
(5, 'MEC-WShop', 40),      -- Corrected: 'MEC-Workshop' is now 'MEC-WShop' (10 chars)

-- Rooms for Civil Engineering (Building ID: 6)
(6, 'CIV-101', 80),
(6, 'CIV-102', 80),

-- Rooms for Electrical and Computer Engineering (Building ID: 7)
(7, 'ECE-101', 90),
(7, 'ECE-CLabA', 40),      -- Corrected: 'ECE-CompLabA' is now 'ECE-CLabA' (9 chars)
(7, 'ECE-ELabB', 35),      -- Corrected: 'ECE-ElecLabB' is now 'ECE-ELabB' (9 chars)

-- Rooms for Mathematical Sciences (Building ID: 8)
(8, 'MATH-301', 100),
(8, 'MATH-302', 100),

-- Rooms for Physics (Building ID: 9)
(9, 'PHY-401', 75),
(9, 'PHY-LabA', 30),

-- Rooms for Chemistry (Building ID: 10)
(10, 'CHEM-101', 75),
(10, 'CHEM-LabA', 30),

-- Rooms for other centers (IDs 11 to 18)
(11, 'TRN-101', 40),
(12, 'WRK-A', 50),
(13, 'LANG-1', 30),
(13, 'LANG-2', 30),
(14, 'ISL-101', 60),
(15, 'GYM-A', 200),
(16, 'TEX-101', 40),
(17, 'AGR-101', 50),
(18, 'NR-101', 50);
GO

---------------------------------------------------------------------------------------------------

-- major
INSERT INTO Education.Major (name, department_id) VALUES
('Materials Engineering', 1),          -- Corresponds to Materials Engineering Dept.
('Mining Engineering', 2),             -- Corresponds to Mining Engineering Dept.
('Industrial Engineering', 3),         -- Corresponds to Industrial Engineering Dept.
('Chemical Engineering', 4),           -- Corresponds to Chemical Engineering Dept.
('Mechanical Engineering', 5),         -- Corresponds to Mechanical Engineering Dept.
('Civil Engineering', 6),              -- Corresponds to Civil Engineering Dept.
('Electrical Engineering', 7),         -- Corresponds to Electrical and Computer Eng. Dept.
('Computer Engineering', 7),           -- Corresponds to Electrical and Computer Eng. Dept.
('Transportation Engineering', 11),    -- Corresponds to Transportation Engineering Dept.
('Textile Engineering', 16),           -- Corresponds to Textile Engineering Dept.
('Agricultural Engineering', 17),      -- Corresponds to Agriculture Dept.
('Natural Resources Engineering', 18), -- Corresponds to Natural Resources Dept.
('Mathematics', 8),                    -- Corresponds to Mathematical Sciences Dept.
('Physics', 9),                        -- Corresponds to Physics Dept.
('Chemistry', 10);                     -- Corresponds to Chemistry Dept.
GO

---------------------------------------------------------------------------------------------------

-- instructor
INSERT INTO Education.Instructor (first_name, last_name, email, phone, title, department_id) VALUES
-- Department ID 1: Materials Engineering
('Reza', 'Karimi', 'r.karimi1@university.ac.ir', '+989121000001', 'Professor', 1),
('Sara', 'Alizadeh', 's.alizadeh1@university.ac.ir', '+989121000002', 'Associate Professor', 1),
('Kian', 'Sadeghi', 'k.sadeghi1@university.ac.ir', '+989121000003', 'Assistant Professor', 1),
('Parisa', 'Mousavi', 'p.mousavi1@university.ac.ir', '+989121000004', 'Assistant Professor', 1),
('Babak', 'Jafari', 'b.jafari1@university.ac.ir', '+989121000005', 'Lecturer', 1),
('Nazanin', 'Hashemi', 'n.hashemi1@university.ac.ir', '+989121000006', 'Professor', 1),
('Kasra', 'Ebrahimi', 'k.ebrahimi1@university.ac.ir', '+989121000007', 'Assistant Professor', 1),
('Shadi', 'Ghasemi', 's.ghasemi1@university.ac.ir', '+989121000008', 'Associate Professor', 1),
('Arash', 'Rostami', 'a.rostami1@university.ac.ir', '+989121000009', 'Lecturer', 1),
('Mina', 'Abbasi', 'm.abbasi1@university.ac.ir', '+989121000010', 'Assistant Professor', 1),

-- Department ID 2: Mining Engineering
('Amir', 'Hosseini', 'a.hosseini1@university.ac.ir', '+989122000001', 'Professor', 2),
('Neda', 'Bagheri', 'n.bagheri1@university.ac.ir', '+989122000002', 'Associate Professor', 2),
('Farhad', 'Rezaei', 'f.rezaei1@university.ac.ir', '+989122000003', 'Assistant Professor', 2),
('Yasaman', 'Ahmadi', 'y.ahmadi1@university.ac.ir', '+989122000004', 'Professor', 2),
('Sina', 'Moradi', 's.moradi1@university.ac.ir', '+989122000005', 'Lecturer', 2),
('Lida', 'Salimi', 'l.salimi1@university.ac.ir', '+989122000006', 'Assistant Professor', 2),
('Maziar', 'Heydari', 'm.heydari1@university.ac.ir', '+989122000007', 'Associate Professor', 2),
('Roya', 'Azizi', 'r.azizi1@university.ac.ir', '+989122000008', 'Assistant Professor', 2),
('Omid', 'Soltani', 'o.soltani1@university.ac.ir', '+989122000009', 'Professor', 2),
('Tara', 'Niknam', 't.niknam1@university.ac.ir', '+989122000010', 'Lecturer', 2),

-- Department ID 3: Industrial Engineering
('Maryam', 'Mohammadi', 'm.mohammadi1@university.ac.ir', '+989123000001', 'Professor', 3),
('Behzad', 'Pour', 'b.pour1@university.ac.ir', '+989123000002', 'Associate Professor', 3),
('Hamed', 'Zare', 'h.zare1@university.ac.ir', '+989123000003', 'Assistant Professor', 3),
('Elham', 'Fathi', 'e.fathi1@university.ac.ir', '+989123000004', 'Professor', 3),
('Payam', 'Davari', 'p.davari1@university.ac.ir', '+989123000005', 'Lecturer', 3),
('Shiva', 'Kaviani', 's.kaviani1@university.ac.ir', '+989123000006', 'Assistant Professor', 3),
('Ehsan', 'Mirzaei', 'e.mirzaei1@university.ac.ir', '+989123000007', 'Associate Professor', 3),
('Sanaz', 'Tehrani', 's.tehrani1@university.ac.ir', '+989123000008', 'Assistant Professor', 3),
('Vahid', 'Bahrami', 'v.bahrami1@university.ac.ir', '+989123000009', 'Professor', 3),
('Gelareh', 'Amiri', 'g.amiri1@university.ac.ir', '+989123000010', 'Lecturer', 3),

-- Department ID 4: Chemical Engineering
('Hossein', 'Akbari', 'h.akbari1@university.ac.ir', '+989124000001', 'Professor', 4),
('Fatemeh', 'Jalali', 'f.jalali1@university.ac.ir', '+989124000002', 'Associate Professor', 4),
('Saeed', 'Kamali', 's.kamali1@university.ac.ir', '+989124000003', 'Assistant Professor', 4),
('Zahra', 'Yousefi', 'z.yousefi1@university.ac.ir', '+989124000004', 'Professor', 4),
('Mehran', 'Naderi', 'm.naderi1@university.ac.ir', '+989124000005', 'Lecturer', 4),
('Aida', 'Rahimi', 'a.rahimi1@university.ac.ir', '+989124000006', 'Assistant Professor', 4),
('Majid', 'Sharifi', 'm.sharifi1@university.ac.ir', '+989124000007', 'Associate Professor', 4),
('Negar', 'Safari', 'n.safari1@university.ac.ir', '+989124000008', 'Assistant Professor', 4),
('Yashar', 'Asadi', 'y.asadi1@university.ac.ir', '+989124000009', 'Professor', 4),
('Marjan', 'Farahani', 'm.farahani1@university.ac.ir', '+989124000010', 'Lecturer', 4),

-- Department ID 5: Mechanical Engineering
('Mohammad', 'Esmaeili', 'm.esmaeili1@university.ac.ir', '+989125000001', 'Professor', 5),
('Samira', 'Hedayati', 's.hedayati1@university.ac.ir', '+989125000002', 'Associate Professor', 5),
('Davood', 'Ghorbani', 'd.ghorbani1@university.ac.ir', '+989125000003', 'Assistant Professor', 5),
('Leila', 'Babaei', 'l.babaei1@university.ac.ir', '+989125000004', 'Professor', 5),
('Ramin', 'Afshar', 'r.afshar1@university.ac.ir', '+989125000005', 'Lecturer', 5),
('Pegah', 'Khodadadi', 'p.khodadadi1@university.ac.ir', '+989125000006', 'Assistant Professor', 5),
('Iman', 'Nabavi', 'i.nabavi1@university.ac.ir', '+989125000007', 'Associate Professor', 5),
('Hanieh', 'Maleki', 'h.maleki1@university.ac.ir', '+989125000008', 'Assistant Professor', 5),
('Alireza', 'Pasha', 'a.pasha1@university.ac.ir', '+989125000009', 'Professor', 5),
('Soheila', 'Zamani', 's.zamani1@university.ac.ir', '+989125000010', 'Lecturer', 5),

-- Department ID 6: Civil Engineering
('Ali', 'Taghavi', 'a.taghavi1@university.ac.ir', '+989126000001', 'Professor', 6),
('Nasrin', 'Javadi', 'n.javadi1@university.ac.ir', '+989126000002', 'Associate Professor', 6),
('Morteza', 'Hakimi', 'm.hakimi1@university.ac.ir', '+989126000003', 'Assistant Professor', 6),
('Shirin', 'Samadi', 's.samadi1@university.ac.ir', '+989126000004', 'Professor', 6),
('Kamran', 'Fallah', 'k.fallah1@university.ac.ir', '+989126000005', 'Lecturer', 6),
('Bita', 'Mahdavi', 'b.mahdavi1@university.ac.ir', '+989126000006', 'Assistant Professor', 6),
('Shahram', 'Vakili', 's.vakili1@university.ac.ir', '+989126000007', 'Associate Professor', 6),
('Golnaz', 'Emami', 'g.emami1@university.ac.ir', '+989126000008', 'Assistant Professor', 6),
('Farid', 'Mansouri', 'f.mansouri1@university.ac.ir', '+989126000009', 'Professor', 6),
('Donya', 'Pakdaman', 'd.pakdaman1@university.ac.ir', '+989126000010', 'Lecturer', 6),

-- Department ID 7: Electrical and Computer Engineering
('Kourosh', 'Sarlak', 'k.sarlak1@university.ac.ir', '+989127000001', 'Professor', 7),
('Mahsa', 'Tabatabaei', 'm.tabatabaei1@university.ac.ir', '+989127000002', 'Professor', 7),
('Dariush', 'Farahmand', 'd.farahmand1@university.ac.ir', '+989127000003', 'Associate Professor', 7),
('Katayoun', 'Azar', 'k.azar1@university.ac.ir', '+989127000004', 'Associate Professor', 7),
('Peyman', 'Abedi', 'p.abedi1@university.ac.ir', '+989127000005', 'Assistant Professor', 7),
('Azadeh', 'Behbahani', 'a.behbahani1@university.ac.ir', '+989127000006', 'Assistant Professor', 7),
('Shahriar', 'Danesh', 's.danesh1@university.ac.ir', '+989127000007', 'Assistant Professor', 7),
('Haleh', 'Monfared', 'h.monfared1@university.ac.ir', '+989127000008', 'Lecturer', 7),
('Jamshid', 'Tavakoli', 'j.tavakoli1@university.ac.ir', '+989127000009', 'Lecturer', 7),
('Mandana', 'Parsa', 'm.parsa1@university.ac.ir', '+989127000010', 'Professor', 7),

-- Department ID 8: Mathematical Sciences
('Bahram', 'Adeli', 'b.adeli1@university.ac.ir', '+989128000001', 'Professor', 8),
('Fereshteh', 'Karimi', 'f.karimi2@university.ac.ir', '+989128000002', 'Associate Professor', 8),
('Ghasem', 'Lotfi', 'g.lotfi1@university.ac.ir', '+989128000003', 'Professor', 8),
('Jaleh', 'Niazi', 'j.niazi1@university.ac.ir', '+989128000004', 'Assistant Professor', 8),
('Milad', 'Oskouei', 'm.oskouei1@university.ac.ir', '+989128000005', 'Assistant Professor', 8),
('Parvaneh', 'Qasemi', 'p.qasemi1@university.ac.ir', '+989128000006', 'Lecturer', 8),
('Siavash', 'Rahman', 's.rahman1@university.ac.ir', '+989128000007', 'Professor', 8),
('Tahereh', 'Saeedi', 't.saeedi1@university.ac.ir', '+989128000008', 'Associate Professor', 8),
('Yalda', 'Yazdani', 'y.yazdani1@university.ac.ir', '+989128000009', 'Assistant Professor', 8),
('Zahra', 'Hosseini', 'z.hosseini2@university.ac.ir', '+989128000010', 'Professor', 8),

-- Department ID 9: Physics
('Abbas', 'Valipour', 'a.valipour1@university.ac.ir', '+989131000001', 'Professor', 9),
('Bahar', 'Shirazi', 'b.shirazi1@university.ac.ir', '+989131000002', 'Associate Professor', 9),
('Ehsan', 'Zanjani', 'e.zanjani1@university.ac.ir', '+989131000003', 'Assistant Professor', 9),
('Farzaneh', 'Amini', 'f.amini1@university.ac.ir', '+989131000004', 'Professor', 9),
('Hadi', 'Barati', 'h.barati1@university.ac.ir', '+989131000005', 'Lecturer', 9),
('Laleh', 'Cheraghi', 'l.cheraghi1@university.ac.ir', '+989131000006', 'Assistant Professor', 9),
('Navid', 'Dousti', 'n.dousti1@university.ac.ir', '+989131000007', 'Associate Professor', 9),
('Parmis', 'Esfahani', 'p.esfahani1@university.ac.ir', '+989131000008', 'Assistant Professor', 9),
('Saman', 'Fard', 's.fard1@university.ac.ir', '+989131000009', 'Professor', 9),
('Tina', 'Ghafari', 't.ghafari1@university.ac.ir', '+989131000010', 'Lecturer', 9),

-- Department ID 10: Chemistry
('Ahmad', 'Hosseinzadeh', 'a.hosseinzadeh1@university.ac.ir', '+989132000001', 'Professor', 10),
('Behnaz', 'Izadi', 'b.izadi1@university.ac.ir', '+989132000002', 'Associate Professor', 10),
('Farhad', 'Jabbari', 'f.jabbari1@university.ac.ir', '+989132000003', 'Associate Professor', 10),
('Gita', 'Kazemi', 'g.kazemi1@university.ac.ir', '+989132000004', 'Professor', 10),
('Hooman', 'Lashgari', 'h.lashgari1@university.ac.ir', '+989132000005', 'Lecturer', 10),
('Mahshid', 'Madani', 'm.madani1@university.ac.ir', '+989132000006', 'Assistant Professor', 10),
('Nima', 'Nouri', 'n.nouri1@university.ac.ir', '+989132000007', 'Associate Professor', 10),
('Pooneh', 'Omidi', 'p.omidi1@university.ac.ir', '+989132000008', 'Assistant Professor', 10),
('Soroush', 'Panahi', 's.panahi1@university.ac.ir', '+989132000009', 'Professor', 10),
('Yasmin', 'Qorbani', 'y.qorbani1@university.ac.ir', '+989132000010', 'Lecturer', 10),

-- Department ID 11: Transportation Engineering
('Afshin', 'Ranjbar', 'a.ranjbar1@university.ac.ir', '+989141000001', 'Professor', 11),
('Banafsheh', 'Sohrabi', 'b.sohrabi1@university.ac.ir', '+989141000002', 'Associate Professor', 11),
('Erfan', 'Talebi', 'e.talebi1@university.ac.ir', '+989141000003', 'Assistant Professor', 11),
('Fariba', 'Vahidi', 'f.vahidi1@university.ac.ir', '+989141000004', 'Professor', 11),
('Kaveh', 'Yarmohammadi', 'k.yarmohammadi1@university.ac.ir', '+989141000005', 'Lecturer', 11),
('Mehrnaz', 'Zahedi', 'm.zahedi1@university.ac.ir', '+989141000006', 'Assistant Professor', 11),
('Pedram', 'Ahmadian', 'p.ahmadian1@university.ac.ir', '+989141000007', 'Associate Professor', 11),
('Rozhan', 'Biglari', 'r.biglari1@university.ac.ir', '+989141000008', 'Assistant Professor', 11),
('Shayan', 'Chavoshi', 's.chavoshi1@university.ac.ir', '+989141000009', 'Professor', 11),
('Tannaz', 'Daneshvar', 't.daneshvar1@university.ac.ir', '+989141000010', 'Lecturer', 11),

-- Department ID 12: Training Workshops
('Aidin', 'Ebrahimi', 'a.ebrahimi2@university.ac.ir', '+989151000001', 'Lecturer', 12),
('Baran', 'Fallahi', 'b.fallahi1@university.ac.ir', '+989151000002', 'Lecturer', 12),
('Ehsan', 'Ghasemi', 'e.ghasemi2@university.ac.ir', '+989151000003', 'Lecturer', 12),
('Farnaz', 'Hamidi', 'f.hamidi1@university.ac.ir', '+989151000004', 'Lecturer', 12),
('Kambiz', 'Jahanbani', 'k.jahanbani1@university.ac.ir', '+989151000005', 'Lecturer', 12),
('Mahdis', 'Kiani', 'm.kiani1@university.ac.ir', '+989151000006', 'Lecturer', 12),
('Pouria', 'Lari', 'p.lari1@university.ac.ir', '+989151000007', 'Lecturer', 12),
('Saba', 'Moeini', 's.moeini1@university.ac.ir', '+989151000008', 'Lecturer', 12),
('Shervin', 'Naderi', 's.naderi2@university.ac.ir', '+989151000009', 'Lecturer', 12),
('Tara', 'Oveisi', 't.oveisi1@university.ac.ir', '+989151000010', 'Lecturer', 12),

-- Department ID 13: English Language Center
('Anahita', 'Parvin', 'a.parvin1@university.ac.ir', '+989152000001', 'Lecturer', 13),
('Bijan', 'Qaderi', 'b.qaderi1@university.ac.ir', '+989152000002', 'Lecturer', 13), -- CORRECTED THIS LINE
('Elika', 'Riahi', 'e.riahi1@university.ac.ir', '+989152000003', 'Lecturer', 13),
('Fardis', 'Saber', 'f.saber1@university.ac.ir', '+989152000004', 'Lecturer', 13),
('Kiana', 'Tavakolian', 'k.tavakolian1@university.ac.ir', '+989152000005', 'Lecturer', 13),
('Mahan', 'Vahdat', 'm.vahdat1@university.ac.ir', '+989152000006', 'Lecturer', 13),
('Pantea', 'Zand', 'p.zand1@university.ac.ir', '+989152000007', 'Lecturer', 13),
('Sahar', 'Alavi', 's.alavi1@university.ac.ir', '+989152000008', 'Lecturer', 13),
('Shahin', 'Boroumand', 's.boroumand1@university.ac.ir', '+989152000009', 'Lecturer', 13),
('Tiam', 'Diba', 't.diba1@university.ac.ir', '+989152000010', 'Lecturer', 13),

-- Department ID 14: Islamic Teaching
('Abdolreza', 'Fatemi', 'a.fatemi1@university.ac.ir', '+989161000001', 'Lecturer', 14),
('Bibi', 'Ghafouri', 'b.ghafouri1@university.ac.ir', '+989161000002', 'Lecturer', 14),
('Esmail', 'Hasanzadeh', 'e.hasanzadeh1@university.ac.ir', '+989161000003', 'Lecturer', 14),
('Forough', 'Jalilian', 'f.jalilian1@university.ac.ir', '+989161000004', 'Lecturer', 14),
('Karim', 'Karampour', 'k.karampour1@university.ac.ir', '+989161000005', 'Lecturer', 14),
('Masoumeh', 'Labbaf', 'm.labbaf1@university.ac.ir', '+989161000006', 'Lecturer', 14),
('Qasem', 'Momeni', 'q.momeni1@university.ac.ir', '+989161000007', 'Lecturer', 14),
('Sediqeh', 'Nazari', 's.nazari1@university.ac.ir', '+989161000008', 'Lecturer', 14),
('Sharif', 'Ostovari', 's.ostovari1@university.ac.ir', '+989161000009', 'Lecturer', 14),
('Tayebeh', 'Pourjavad', 't.pourjavad1@university.ac.ir', '+989161000010', 'Lecturer', 14),

-- Department ID 15: Physical Education
('Arman', 'Qahremani', 'a.qahremani1@university.ac.ir', '+989171000001', 'Lecturer', 15),
('Bardia', 'Ramezani', 'b.ramezani1@university.ac.ir', '+989171000002', 'Lecturer', 15),
('Elnaz', 'Sadeghian', 'e.sadeghian1@university.ac.ir', '+989171000003', 'Lecturer', 15),
('Farrokh', 'Taheri', 'f.taheri1@university.ac.ir', '+989171000004', 'Lecturer', 15),
('Kimia', 'Valizadeh', 'k.valizadeh1@university.ac.ir', '+989171000005', 'Lecturer', 15),
('Mani', 'Yazdani', 'm.yazdani2@university.ac.ir', '+989171000006', 'Lecturer', 15),
('Pardis', 'Zakeri', 'p.zakeri1@university.ac.ir', '+989171000007', 'Lecturer', 15),
('Sasan', 'Arefi', 's.arefi1@university.ac.ir', '+989171000008', 'Lecturer', 15),
('Shahrzad', 'Bayati', 's.bayati1@university.ac.ir', '+989171000009', 'Lecturer', 15),
('Touraj', 'Dabiri', 't.dabiri1@university.ac.ir', '+989171000010', 'Lecturer', 15),

-- Department ID 16: Textile Engineering
('Armita', 'Eshraghi', 'a.eshraghi1@university.ac.ir', '+989351000001', 'Professor', 16),
('Benyamin', 'Foroutan', 'b.foroutan1@university.ac.ir', '+989351000002', 'Associate Professor', 16),
('Elaheh', 'Givian', 'e.givian1@university.ac.ir', '+989351000003', 'Assistant Professor', 16),
('Farshad', 'Hojjati', 'f.hojjati1@university.ac.ir', '+989351000004', 'Professor', 16),
('Kiana', 'Izadpanah', 'k.izadpanah1@university.ac.ir', '+989351000005', 'Lecturer', 16),
('Melika', 'Javanmardi', 'm.javanmardi1@university.ac.ir', '+989351000006', 'Assistant Professor', 16),
('Pouyan', 'Kamrani', 'p.kamrani1@university.ac.ir', '+989351000007', 'Associate Professor', 16),
('Sareh', 'Lankarani', 's.lankarani1@university.ac.ir', '+989351000008', 'Assistant Professor', 16),
('Shayan', 'Mirshahi', 's.mirshahi1@university.ac.ir', '+989351000009', 'Professor', 16),
('Tarlan', 'Nikkhah', 't.nikkhah1@university.ac.ir', '+989351000010', 'Lecturer', 16),

-- Department ID 17: Agriculture
('Ashkan', 'Omidi', 'a.omidi2@university.ac.ir', '+989361000001', 'Professor', 17),
('Borzoo', 'Pahlavan', 'b.pahlavan1@university.ac.ir', '+989361000002', 'Associate Professor', 17),
('Elnaz', 'Qadimi', 'e.qadimi1@university.ac.ir', '+989361000003', 'Assistant Professor', 17),
('Ghazal', 'Rastegar', 'g.rastegar1@university.ac.ir', '+989361000004', 'Professor', 17),
('Khashayar', 'Saadati', 'k.saadati1@university.ac.ir', '+989361000005', 'Lecturer', 17),
('Melina', 'Tahmasbi', 'm.tahmasbi1@university.ac.ir', '+989361000006', 'Assistant Professor', 17),
('Ramin', 'Vahdati', 'r.vahdati1@university.ac.ir', '+989361000007', 'Associate Professor', 17),
('Setareh', 'Yaghoubi', 's.yaghoubi1@university.ac.ir', '+989361000008', 'Assistant Professor', 17),
('Shervin', 'Zarrabi', 's.zarrabi1@university.ac.ir', '+989361000009', 'Professor', 17),
('Termeh', 'Aghaei', 't.aghaei1@university.ac.ir', '+989361000010', 'Lecturer', 17),

-- Department ID 18: Natural Resources
('Arsia', 'Bahadori', 'a.bahadori1@university.ac.ir', '+989371000001', 'Professor', 18),
('Delaram', 'Chalabi', 'd.chalabi1@university.ac.ir', '+989371000002', 'Associate Professor', 18),
('Farzin', 'Davoodi', 'f.davoodi1@university.ac.ir', '+989371000003', 'Assistant Professor', 18),
('Gisoo', 'Eskandari', 'g.eskandari1@university.ac.ir', '+989371000004', 'Professor', 18),
('Keyvan', 'Fotouhi', 'k.fotouhi1@university.ac.ir', '+989371000005', 'Lecturer', 18),
('Niousha', 'Gerami', 'n.gerami1@university.ac.ir', '+989371000006', 'Assistant Professor', 18),
('Rouzbeh', 'Hadian', 'r.hadian1@university.ac.ir', '+989371000007', 'Associate Professor', 18),
('Setayesh', 'Imani', 's.imani1@university.ac.ir', '+989371000008', 'Assistant Professor', 18),
('Sirvan', 'Javid', 's.javid1@university.ac.ir', '+989371000009', 'Professor', 18),
('Yas', 'Khosravi', 'y.khosravi1@university.ac.ir', '+989371000010', 'Lecturer', 18);
GO

---------------------------------------------------------------------------------------------------

-- depatment head
INSERT INTO Education.Department_Head (department_id, instructor_id, start_date, end_date) VALUES
(1, 1, '2024-09-01', NULL),   -- Head of Materials Engineering: Reza Karimi
(2, 11, '2024-09-01', NULL),  -- Head of Mining Engineering: Amir Hosseini
(3, 21, '2024-09-01', NULL),  -- Head of Industrial Engineering: Maryam Mohammadi
(4, 31, '2024-09-01', NULL),  -- Head of Chemical Engineering: Hossein Akbari
(5, 41, '2024-09-01', NULL),  -- Head of Mechanical Engineering: Mohammad Esmaeili
(6, 51, '2024-09-01', NULL),  -- Head of Civil Engineering: Ali Taghavi
(7, 61, '2024-09-01', NULL),  -- Head of Electrical and Computer Engineering: Kourosh Sarlak
(8, 71, '2024-09-01', NULL),  -- Head of Mathematical Sciences: Bahram Adeli
(9, 81, '2024-09-01', NULL),  -- Head of Physics: Abbas Valipour
(10, 91, '2024-09-01', NULL), -- Head of Chemistry: Ahmad Hosseinzadeh
(11, 101, '2024-09-01', NULL),-- Head of Transportation Engineering: Afshin Ranjbar
(12, 111, '2024-09-01', NULL),-- Head of Training Workshops: Aidin Ebrahimi
(13, 121, '2024-09-01', NULL),-- Head of English Language Center: Anahita Parvin
(14, 131, '2024-09-01', NULL),-- Head of Islamic Teaching: Abdolreza Fatemi
(15, 141, '2024-09-01', NULL),-- Head of Physical Education: Arman Qahremani
(16, 151, '2024-09-01', NULL),-- Head of Textile Engineering: Armita Eshraghi
(17, 161, '2024-09-01', NULL),-- Head of Agriculture: Ashkan Omidi
(18, 171, '2024-09-01', NULL); -- Head of Natural Resources: Arsia Bahadori
GO

---------------------------------------------------------------------------------------------------

-- courses
INSERT INTO Education.Course (title, credits, department_id) VALUES
('Islamic History', 2, 14),
('Persian Literature', 3, 14),
('Islamic Ethics', 2, 14),
('Islamic Revolution and its Roots', 2, 14),
('Physical Education 1', 1, 15),
('Physical Education 2', 1, 15),
('Volleyball', 1, 15),
('Basketball', 1, 15),
('Swimming', 1, 15),
('Aerobics', 1, 15),
('Martial Arts', 1, 15),
('General English for Engineering', 3, 13),
('Specialized English for Electrical Engineering', 2, 13),
('Specialized English for Computer Engineering', 2, 13),
('Specialized English for Mechanical Engineering', 2, 13),
('Specialized English for Chemical Engineering', 2, 13),
('Specialized English for Industrial Engineering', 2, 13),
('Specialized English for Civil Engineering', 2, 13),
('Specialized English for Physics', 2, 13),
('Specialized English for Chemistry', 2, 13),
('Mathematics 1', 3, 8),
('Mathematics 2', 3, 8),
('Differential Equations', 3, 8),
('Engineering Mathematics', 3, 8),
('Applied Linear Algebra', 3, 8),
('Engineering Probability and Statistics', 3, 8),
('Game Theory', 3, 8),
('Physics 1', 3, 9),
('Physics 2', 3, 9),
('Physics 1 Lab', 1, 9),
('Physics 2 Lab (Electricity)', 1, 9),
('Computer Programming Fundamentals', 4, 7),
('Advanced Programming', 4, 7),
('Discrete Structures', 3, 7),
('Digital Systems Design 1', 3, 7),
('Digital Systems Design 1 Lab', 1, 7),
('Electrical Circuits 1', 3, 7),
('Electrical Circuits 2', 3, 7),
('Electrical Circuits Lab', 1, 7),
('Electronics 1', 3, 7),
('Electronics 2', 3, 7),
('Electronics 1 Lab', 1, 7),
('Electromagnetics', 3, 7),
('Signals and Systems', 3, 7),
('Linear Control Systems', 3, 7),
('Electric Machines 1', 3, 7),
('Computer Architecture and Organization', 3, 7),
('Data Structures', 3, 7),
('Algorithms Design', 3, 7),
('Operating Systems', 3, 7),
('Computer Networks 1', 3, 7),
('Microprocessors', 3, 7),
('Microprocessors Lab', 1, 7),
('Statics', 3, 5),
('Dynamics', 3, 5),
('Strength of Materials 1', 3, 5),
('Thermodynamics 1', 3, 5),
('Fluid Mechanics', 3, 5),
('Vibrations', 3, 5),
('Engineering Geology', 2, 6),
('Structural Analysis 1', 3, 6),
('Soil Mechanics', 3, 6),
('Concrete Technology', 2, 6),
('Mass and Energy Balances', 3, 4),
('Chemical Reaction Engineering', 3, 4),
('Process Control', 3, 4),
('Mass Transfer Operations', 3, 4),
('Engineering Economy', 3, 3),
('Operations Research 1', 3, 3),
('Project Management', 3, 3),
('Quality Control', 3, 3),
('Introduction to Materials Science', 3, 1),
('Thermodynamics of Materials', 3, 1),
('Mechanical Properties of Materials', 3, 1),
('Introduction to Soil Science', 3, 17),
('Principles of Agronomy', 3, 17),
('Irrigation Principles', 3, 17),
('Introduction to Computer Engineering', 2, 7),
('Computer Workshop', 1, 7),
('Electrical and Electronic Circuits', 3, 7),
('Hardware Description Languages', 3, 7),
('Languages and Automata Theory', 3, 7),
('Scientific and Technical Presentation', 2, 7),
('Bachelors Project', 3, 7),
('Software Engineering 1', 3, 7),
('Software Engineering 1 Lab', 1, 7),
('Software Engineering 2', 3, 7),
('Databases 1', 3, 7),
('Database Lab', 1, 7),
('Databases 2', 3, 7),
('Compiler', 3, 7),
('Fundamentals of Computational Intelligence', 3, 7),
('Fundamentals of Machine Vision', 3, 7),
('Fundamentals of Data Mining', 3, 7),
('Computer Networks 2', 3, 7),
('Computer Networks Lab', 1, 7),
('Internet Engineering', 3, 7),
('IT Fundamentals', 3, 7),
('IT Project Management', 3, 7),
('Cryptography Fundamentals', 3, 7),
('Secure Computing Fundamentals', 3, 7),
('Network Security', 3, 7),
('Secure Software Development', 3, 7),
('Architecture Laboratory', 1, 7),
('Interface Circuits Laboratory', 1, 7),
('Machine Vision Lab', 1, 7),
('Computational Intelligence Lab', 1, 7),
('Islamic Thought 1', 2, 14),
('Islamic Thought 2', 2, 14),
('Thematic Interpretation of Quran', 2, 14),
('Family and Population Knowledge', 2, 14);
Go

---------------------------------------------------------------------------------------------------

-- curriculum
INSERT INTO Education.Curriculum (major_id, course_id, suggested_term, is_optional, priority) VALUES
-- Term 1
(27, 21, 1, 0, 1),  -- Mathematics 1
(27, 28, 1, 0, 2),  -- Physics 1
(27, 32, 1, 0, 3),  -- Computer Programming Fundamentals
(27, 79, 1, 0, 4),  -- Computer Workshop
(27, 78, 1, 0, 5),  -- Introduction to Computer Engineering
(27, 12, 1, 0, 6),  -- General English for Engineering
(27, 5, 1, 0, 7),   -- Physical Education 1
(27, 2, 1, 0, 8),   -- Persian Literature (As a sample for "Maaref" group)

-- Term 2
(27, 22, 2, 0, 1),  -- Mathematics 2
(27, 29, 2, 0, 2),  -- Physics 2
(27, 33, 2, 0, 3),  -- Advanced Programming
(27, 34, 2, 0, 4),  -- Discrete Structures
(27, 23, 2, 0, 5),  -- Differential Equations
(27, 31, 2, 0, 6),  -- Physics 2 Lab (Electricity)
(27, 3, 2, 0, 7),   -- Islamic Ethics (As a sample for "Maaref" group)

-- Term 3
(27, 26, 3, 0, 1),  -- Engineering Probability and Statistics
(27, 24, 3, 0, 2),  -- Engineering Mathematics
(27, 80, 3, 0, 3),  -- Electrical and Electronic Circuits
(27, 48, 3, 0, 4),  -- Data Structures
(27, 35, 3, 0, 5),  -- Digital Systems Design 1
(27, 36, 3, 0, 6),  -- Digital Systems Design 1 Lab
(27, 4, 3, 0, 7),   -- Islamic Revolution and its Roots (As a sample for "Maaref" group)

-- Term 4
(27, 47, 4, 0, 1),  -- Computer Architecture and Organization
(27, 51, 4, 0, 2),  -- Computer Networks 1
(27, 49, 4, 0, 3),  -- Algorithms Design
(27, 81, 4, 0, 4),  -- Hardware Description Languages
(27, 14, 4, 0, 5),  -- Specialized English for Computer Engineering
(27, 6, 4, 0, 6),   -- Physical Education 2
(27, 1, 4, 0, 7),   -- Islamic History (As a sample for "Maaref" group)

-- Term 5
(27, 52, 5, 0, 1),  -- Microprocessors
(27, 50, 5, 0, 2),  -- Operating Systems
(27, 44, 5, 0, 3),  -- Signals and Systems
(27, 46, 5, 1, 4),  
(27, 82, 5, 0, 5),  -- Languages and Automata Theory
(27, 96, 5, 0, 6),  -- Computer Networks Lab
(27, 53, 5, 0, 7),  
(27, 91, 6, 0, 1),  
(27, 83, 6, 0, 2), 
(27, 92, 6, 1, 3), 
(27, 98, 6, 1, 4),  
(27, 104, 6, 1, 5),
(27, 85, 7, 0, 1), 
(27, 88, 7, 0, 2),  
(27, 84, 7, 0, 3),  
(27, 94, 7, 1, 4),  
(27, 97, 7, 1, 5),  
(27, 87, 8, 1, 1),  
(27, 102, 8, 1, 2), 
(27, 90, 8, 1, 3); 
INSERT INTO Education.Curriculum (major_id, course_id, suggested_term, is_optional, priority) VALUES
(27, 108, 5, 0, 8),  
(27, 109, 6, 0, 6),   
(27, 110, 7, 0, 6),   
(27, 111, 8, 0, 4),
(27, 98, 7, 1, 7),
(27, 100, 8, 1, 5);
INSERT INTO Education.Curriculum (major_id, course_id, suggested_term, is_optional, priority) VALUES
(27, 86, 7, 0, 3),
(27, 89, 7, 0, 5), 
(27, 105, 5, 0, 8), 
(27, 107, 6, 1, 8), 
(27, 106, 8, 1, 7), 
(27, 95, 6, 1, 9),  
(27, 93, 8, 1, 6), 
(27, 99, 8, 1, 8),  
(27, 101, 8, 1, 9), 
(27, 103, 8, 1, 10);

---------------------------------------------------------------------------------------------------

-- offered course
INSERT INTO Education.Offered_Course (course_id, instructor_id, semester_id, room_id, capacity, section_number, class_day_type, start_hour) VALUES
(21, 71, 3, 1, 80, '01', 'Odd', 8),--1
(21, 72, 3, 2, 80, '02', 'Even', 8),--2
(28, 81, 3, 3, 70, '01', 'Odd', 10), --3
(28, 82, 3, 4, 70, '02', 'Even', 10), --4
(32, 61, 3, 5, 50, '01', 'Odd', 13),--5
(32, 62, 3, 6, 50, '02', 'Even', 13),--6
(79, 63, 3, 7, 40, '01', 'Odd', 15), --7
(78, 64, 3, 8, 90, '01', 'Even', 15), --8
(12, 121, 3, 23, 80, '01', 'Odd', 8), --9
(5, 141, 3, 26, 95, '01', 'Even', 8), --10
(2, 131, 3, 24, 60, '01', 'Odd', 10),--11
(22, 73, 3, 9, 100, '01', 'Even', 10),--12
(22, 74, 3, 10, 100, '02', 'Odd', 13),--13
(29, 83, 3, 11, 70, '01', 'Even', 13),--14
(29, 84, 3, 12, 70, '02', 'Odd', 15),--15
(33, 65, 3, 13, 50, '01', 'Even', 15),--16
(33, 66, 3, 14, 50, '02', 'Odd', 8),--17
(34, 67, 3, 15, 50, '01', 'Even', 8),--18
(23, 75, 3, 16, 100, '01', 'Odd', 10),--19
(31, 85, 3, 17, 30, '01', 'Even', 10),--20
(3, 132, 3, 25, 60, '01', 'Odd', 13),--21
(26, 76, 3, 18, 90, '01', 'Even', 13),--22
(24, 77, 3, 19, 90, '01', 'Odd', 15),--23
(80, 68, 3, 20, 40, '01', 'Even', 15),--24
(48, 69, 3, 21, 40, '01', 'Odd', 8),--25
(48, 70, 3, 22, 40, '02', 'Even', 8),--26
(35, 61, 3, 1 , 45, '01', 'Odd', 10),--27
(36, 62, 3, 2 , 45, '01', 'Even', 10),--28
(4, 133, 3, 24, 60, '01', 'Odd', 13),--29
(47, 63, 3, 3 , 45, '01', 'Even', 13),--30
(51, 64, 3, 4 , 45, '01', 'Odd', 15),--31
(49, 65, 3, 5 , 45, '01', 'Even', 15),--32
(49, 66, 3, 6, 45, '02', 'Odd', 8),--33
(81, 67, 3, 7, 45, '01', 'Even', 8),--34
(14, 122, 3, 23, 80, '01', 'Odd', 10),--35
(6, 142, 3, 26, 95, '01', 'Even', 10),--36
(1, 134, 3, 25, 60, '01', 'Odd', 13),--37
(52, 68, 3, 8 , 40, '01', 'Even', 13),--38
(50, 69, 3, 9, 40, '01', 'Odd', 15),--39
(44, 78, 3, 18, 90, '01', 'Even', 15),--40
(46, 70, 3, 10, 40, '01', 'Odd', 8),--41
(82, 61, 3, 11, 40, '01', 'Even', 8),--42
(96, 62, 3, 12, 40, '01', 'Odd', 10),--43
(53, 63 , 3, 13 , 40, '01', 'Even', 10),--44
(108,135, 3, 24, 60, '01', 'Odd', 13),--45
(91, 64 , 3, 14, 40, '01', 'Even', 13),--46
(83, 123, 3, 23, 80, '01', 'Odd', 15),--47
(92, 65 , 3, 15, 40, '01', 'Even', 15),--48
(98, 66 , 3, 1, 40, '01', 'Odd', 8),--49
(104, 67, 3, 2 ,35, '01', 'Even', 8),--50 
(109,136, 3,25, 60, '01', 'Odd', 10),--51
(85, 68 , 3, 3, 40, '01', 'Even', 10),--52
(88, 69 , 3, 4, 40, '01', 'Odd', 13),--53
(84, 70 , 3, 5, 40, '01', 'Even', 13),--54
(94, 61 , 3, 6, 40, '01', 'Odd', 15),--55
(97 , 62, 3, 7, 40, '01', 'Even', 15),--56
(110,137, 3,24, 60, '01', 'Odd', 8),--57
(99 , 63, 3, 8, 40, '01', 'Even', 8),--58
(87 , 64, 3, 9, 40, '01', 'Odd', 10),--59
(102, 65, 3,10, 40, '01', 'Even', 10),--60
(90 , 66, 3,11, 40, '01', 'Odd', 13),--61
(111, 138, 3, 25 , 60, '01', 'Even', 13),--62
(100, 67, 3, 12, 40, '01', 'Odd', 15),--63
(21, 71, 4, 1, 80, '01', 'Odd', 8),--64
(21, 72, 4, 2, 80, '02', 'Even', 8),--65
(28, 81, 4, 3, 70, '01', 'Odd', 10), --66
(28, 82, 4, 4, 70, '02', 'Even', 10), --67
(32, 61, 4, 5, 50, '01', 'Odd', 13),--68
(32, 62, 4, 6, 50, '02', 'Even', 13),--69
(79, 63, 4, 7, 40, '01', 'Odd', 15), --70
(78, 64, 4, 8, 90, '01', 'Even', 15), --71
(12, 121, 4, 23, 80, '01', 'Odd', 8), --72
(5, 141, 4, 26, 95, '01', 'Even', 8), --73
(2, 131, 4, 24, 60, '01', 'Odd', 10),--74
(22, 73, 4, 9, 100, '01', 'Even', 10),--74
(22, 74, 4, 10, 100, '02', 'Odd', 13),--76
(29, 83, 4, 11, 70, '01', 'Even', 13),--77
(29, 84, 4, 12, 70, '02', 'Odd', 15),--78
(33, 65, 4, 13, 50, '01', 'Even', 15),--79
(33, 66, 4, 14, 50, '02', 'Odd', 8),--80
(34, 67, 4, 15, 50, '01', 'Even', 8),--81
(23, 75, 4, 16, 100, '01', 'Odd', 10),--82
(31, 85, 4, 17, 30, '01', 'Even', 10),--83
(3, 132, 4, 25, 60, '01', 'Odd', 13),--84
(26, 76, 4, 18, 90, '01', 'Even', 13),--85
(24, 77, 4, 19, 90, '01', 'Odd', 15),--86
(80, 68, 4, 20, 40, '01', 'Even', 15),--87
(48, 69, 4, 21, 40, '01', 'Odd', 8),--88
(48, 70, 4, 22, 40, '02', 'Even', 8),--89
(35, 61, 4, 1 , 45, '01', 'Odd', 10),--90
(36, 62, 4, 2 , 45, '01', 'Even', 10),--91
(4, 133, 4, 24, 60, '01', 'Odd', 13),--92
(47, 63, 4, 3 , 45, '01', 'Even', 13),--93
(51, 64, 4, 4 , 45, '01', 'Odd', 15),--94
(49, 65, 4, 5 , 45, '01', 'Even', 15),--95
(49, 66, 4, 6, 45, '02', 'Odd', 8),--96
(81, 67, 4, 7, 45, '01', 'Even', 8),--97
(14, 122, 4, 23, 80, '01', 'Odd', 10),--98
(6, 142, 4, 26, 95, '01', 'Even', 10),--99
(1, 134, 4, 25, 60, '01', 'Odd', 13),--100
(52, 68, 4, 8 , 40, '01', 'Even', 13),--101
(50, 69, 4, 9, 40, '01', 'Odd', 15),--102
(44, 78, 4, 18, 90, '01', 'Even', 15),--103
(46, 70, 4, 10, 40, '01', 'Odd', 8),--104
(82, 61, 4, 11, 40, '01', 'Even', 8),--105
(96, 62, 4, 12, 40, '01', 'Odd', 10),--106
(53, 63 , 4, 13 , 40, '01', 'Even', 10),--107
(108,135, 4, 24, 60, '01', 'Odd', 13),--108
(91, 64 , 4, 14, 40, '01', 'Even', 13),--109
(83, 123, 4, 23, 80, '01', 'Odd', 15),--110
(92, 65 , 4, 15, 40, '01', 'Even', 15),--111
(98, 66 , 4, 1, 40, '01', 'Odd', 8),--112
(104, 67, 4, 2 ,35, '01', 'Even', 8),--113 
(109,136, 4,25, 60, '01', 'Odd', 10),--114
(85, 68 , 4, 3, 40, '01', 'Even', 10),--115
(88, 69 , 4, 4, 40, '01', 'Odd', 13),--116
(84, 70 , 4, 5, 40, '01', 'Even', 13),--117
(94, 61 , 4, 6, 40, '01', 'Odd', 15),--118
(97 , 62, 4, 7, 40, '01', 'Even', 15),--119
(110,137, 4,24, 60, '01', 'Odd', 8),--120
(99 , 63, 4, 8, 40, '01', 'Even', 8),--121
(87 , 64, 4, 9, 40, '01', 'Odd', 10),--122
(102, 65, 4,10, 40, '01', 'Even', 10),--123
(90 , 66, 4,11, 40, '01', 'Odd', 13),--124
(111, 138, 4, 25 , 60, '01', 'Even', 13),--125
(100, 67, 4, 12, 40, '01', 'Odd', 15),--126
(21, 71, 5, 1, 80, '01', 'Odd', 8),--127
(21, 72, 5, 2, 80, '02', 'Even', 8),--128
(28, 81, 5, 3, 70, '01', 'Odd', 10), --129
(28, 82, 5, 4, 70, '02', 'Even', 10), --130
(32, 61, 5, 5, 50, '01', 'Odd', 13),--131
(32, 62, 5, 6, 50, '02', 'Even', 13),--132
(79, 63, 5, 7, 40, '01', 'Odd', 15), --133
(78, 64, 5, 8, 90, '01', 'Even', 15), --134
(12, 121, 5, 23, 80, '01', 'Odd', 8), --135
(5, 141, 5, 26, 95, '01', 'Even', 8), --136
(2, 131, 5, 24, 60, '01', 'Odd', 10),--137
(22, 73, 5, 9, 100, '01', 'Even', 10),--138
(22, 74, 5, 10, 100, '02', 'Odd', 13),--139
(29, 83, 5, 11, 70, '01', 'Even', 13),--140
(29, 84, 5, 12, 70, '02', 'Odd', 15),--141
(33, 65, 5, 13, 50, '01', 'Even', 15),--142
(33, 66, 5, 14, 50, '02', 'Odd', 8),--143
(34, 67, 5, 15, 50, '01', 'Even', 8),--144
(23, 75, 5, 16, 100, '01', 'Odd', 10),--145
(31, 85, 5, 17, 30, '01', 'Even', 10),--146
(3, 132, 5, 25, 60, '01', 'Odd', 13),--147
(26, 76, 5, 18, 90, '01', 'Even', 13),--148
(24, 77, 5, 19, 90, '01', 'Odd', 15),--149
(80, 68, 5, 20, 40, '01', 'Even', 15),--150
(48, 69, 5, 21, 40, '01', 'Odd', 8),--151
(48, 70, 5, 22, 40, '02', 'Even', 8),--152
(35, 61, 5, 1 , 45, '01', 'Odd', 10),--153
(36, 62, 5, 2 , 45, '01', 'Even', 10),--154
(4, 133, 5, 24, 60, '01', 'Odd', 13),--155
(47, 63, 5, 3 , 45, '01', 'Even', 13),--156
(51, 64, 5, 4 , 45, '01', 'Odd', 15),--157
(49, 65, 5, 5 , 45, '01', 'Even', 15),--158
(49, 66, 5, 6, 45, '02', 'Odd', 8),--159
(81, 67, 5, 7, 45, '01', 'Even', 8),--160
(14, 122,5, 23, 80, '01', 'Odd', 10),--161
(6, 142, 5, 26, 95, '01', 'Even', 10),--162
(1, 134, 5, 25, 60, '01', 'Odd', 13),--163
(52, 68, 5, 8 , 40, '01', 'Even', 13),--164
(50, 69, 5, 9, 40, '01', 'Odd', 15),--165
(44, 78, 5, 18, 90, '01', 'Even', 15),--166
(46, 70, 5, 10, 40, '01', 'Odd', 8),--167
(82, 61, 5, 11, 40, '01', 'Even', 8),--168
(96, 62, 5, 12, 40, '01', 'Odd', 10),--169
(53, 63 ,5, 13 , 40, '01', 'Even', 10),--170
(108,135,5, 24, 60, '01', 'Odd', 13),--171
(91, 64 ,5, 14, 40, '01', 'Even', 13),--172
(83, 123, 5, 23, 80, '01', 'Odd', 15),--173
(92, 65 , 5, 15, 40, '01', 'Even', 15),--174
(98, 66 , 5, 1, 40, '01', 'Odd', 8),--175
(104, 67, 5, 2 ,35, '01', 'Even', 8),--176 
(109,136, 5,25, 60, '01', 'Odd', 10),--177
(85, 68 , 5, 3, 40, '01', 'Even', 10),--178
(88, 69 , 5, 4, 40, '01', 'Odd', 13),--179
(84, 70 , 5, 5, 40, '01', 'Even', 13),--180
(94, 61 , 5, 6, 40, '01', 'Odd', 15),--181
(97 , 62, 5, 7, 40, '01', 'Even', 15),--182
(110,137, 5,24, 60, '01', 'Odd', 8),--183
(99 , 63, 5, 8, 40, '01', 'Even', 8),--184
(87 , 64, 5, 9, 40, '01', 'Odd', 10),--185
(102, 65, 5,10, 40, '01', 'Even', 10),--186
(90 , 66, 5,11, 40, '01', 'Odd', 13),--187
(111, 138,5, 25 , 60, '01', 'Even', 13),--188
(100, 67, 5, 12, 40, '01', 'Odd', 15),--189

(21, 71, 6, 1, 80, '01', 'Odd', 8),--190
(21, 72, 6, 2, 80, '02', 'Even', 8),--191
(28, 81, 6, 3, 70, '01', 'Odd', 10), --192
(28, 82, 6, 4, 70, '02', 'Even', 10), --193
(32, 61, 6, 5, 50, '01', 'Odd', 13),--194
(32, 62, 6, 6, 50, '02', 'Even', 13),--195
(79, 63, 6, 7, 40, '01', 'Odd', 15), --196
(78, 64, 6, 8, 90, '01', 'Even', 15), --197
(12, 121, 6, 23, 80, '01', 'Odd', 8), --198
(5, 141, 6, 26, 95, '01', 'Even', 8), --199
(2, 131, 6, 24, 60, '01', 'Odd', 10),--200
(22, 73, 6, 9, 100, '01', 'Even', 10),--201
(22, 74, 6, 10, 100, '02', 'Odd', 13),--201
(29, 83, 6, 11, 70, '01', 'Even', 13),--203
(29, 84, 6, 12, 70, '02', 'Odd', 15),--204
(33, 65, 6, 13, 50, '01', 'Even', 15),--205
(33, 66, 6, 14, 50, '02', 'Odd', 8),--206
(34, 67, 6, 15, 50, '01', 'Even', 8),--207
(23, 75, 6, 16, 100, '01', 'Odd', 10),--208
(31, 85, 6, 17, 30, '01', 'Even', 10),--209
(3, 132, 6, 25, 60, '01', 'Odd', 13),--210
(26, 76, 6, 18, 90, '01', 'Even', 13),--211
(24, 77, 6, 19, 90, '01', 'Odd', 15),--212
(80, 68, 6, 20, 40, '01', 'Even', 15),--213
(48, 69, 6, 21, 40, '01', 'Odd', 8),--214
(48, 70, 6, 22, 40, '02', 'Even', 8),--215
(35, 61, 6, 1 , 45, '01', 'Odd', 10),--216
(36, 62, 6, 2 , 45, '01', 'Even', 10),--217
(4, 133, 6, 24, 60, '01', 'Odd', 13),--218
(47, 63, 6, 3 , 45, '01', 'Even', 13),--219
(51, 64, 6, 4 , 45, '01', 'Odd', 15),--220
(49, 65, 6, 5 , 45, '01', 'Even', 15),--221
(49, 66, 6, 6, 45, '02', 'Odd', 8),--222
(81, 67, 6, 7, 45, '01', 'Even', 8),--223
(14, 122,6, 23, 80, '01', 'Odd', 10),--224
(6, 142, 6, 26, 95, '01', 'Even', 10),--225
(1, 134, 6, 25, 60, '01', 'Odd', 13),--226
(52, 68, 6, 8 , 40, '01', 'Even', 13),--227
(50, 69, 6, 9, 40, '01', 'Odd', 15),--228
(44, 78, 6, 18, 90, '01', 'Even', 15),--229
(46, 70, 6, 10, 40, '01', 'Odd', 8),--230
(82, 61, 6, 11, 40, '01', 'Even', 8),--231
(96, 62, 6, 12, 40, '01', 'Odd', 10),--232
(53, 63 ,6, 13 , 40, '01', 'Even', 10),--233
(108,135,6, 24, 60, '01', 'Odd', 13),--234
(91, 64 ,6, 14, 40, '01', 'Even', 13),--235
(83, 123, 6, 23, 80, '01', 'Odd', 15),--236
(92, 65 , 6, 15, 40, '01', 'Even', 15),--237
(98, 66 , 6, 1, 40, '01', 'Odd', 8),--238
(104, 67, 6, 2 ,35, '01', 'Even', 8),--239 
(109,136, 6,25, 60, '01', 'Odd', 10),--240
(85, 68 , 6, 3, 40, '01', 'Even', 10),--241
(88, 69 , 6, 4, 40, '01', 'Odd', 13),--242
(84, 70 , 6, 5, 40, '01', 'Even', 13),--243
(94, 61 , 6, 6, 40, '01', 'Odd', 15),--244
(97 , 62, 6, 7, 40, '01', 'Even', 15),--245
(110,137, 6,24, 60, '01', 'Odd', 8),--246
(99 , 63, 6, 8, 40, '01', 'Even', 8),--247
(87 , 64, 6, 9, 40, '01', 'Odd', 10),--248
(102, 65, 6,10, 40, '01', 'Even', 10),--249
(90 , 66, 6,11, 40, '01', 'Odd', 13),--250
(111, 138,6, 25 , 60, '01', 'Even', 13),--251
(100, 67, 6, 12, 40, '01', 'Odd', 15),--252
(21, 71, 7, 1, 80, '01', 'Odd', 8),--1
(21, 72, 7, 2, 80, '02', 'Even', 8),--2
(28, 81, 7, 3, 70, '01', 'Odd', 10), --3
(28, 82, 7, 4, 70, '02', 'Even', 10), --4
(32, 61, 7, 5, 50, '01', 'Odd', 13),--5
(32, 62, 7, 6, 50, '02', 'Even', 13),--6
(79, 63, 7, 7, 40, '01', 'Odd', 15), --7
(78, 64, 7, 8, 90, '01', 'Even', 15), --8
(12, 121, 7, 23, 80, '01', 'Odd', 8), --9
(5, 141, 7, 26, 95, '01', 'Even', 8), --10
(2, 131, 7, 24, 60, '01', 'Odd', 10),--11
(22, 73, 7, 9, 100, '01', 'Even', 10),--12
(22, 74, 7, 10, 100, '02', 'Odd', 13),--13
(29, 83, 7, 11, 70, '01', 'Even', 13),--14
(29, 84, 7, 12, 70, '02', 'Odd', 15),--15
(33, 65, 7, 13, 50, '01', 'Even', 15),--16
(33, 66, 7, 14, 50, '02', 'Odd', 8),--17
(34, 67, 7, 15, 50, '01', 'Even', 8),--18
(23, 75, 7, 16, 100, '01', 'Odd', 10),--19
(31, 85, 7, 17, 30, '01', 'Even', 10),--20
(3, 132, 7, 25, 60, '01', 'Odd', 13),--21
(26, 76, 7, 18, 90, '01', 'Even', 13),--22
(24, 77, 7, 19, 90, '01', 'Odd', 15),--23
(80, 68, 7, 20, 40, '01', 'Even', 15),--24
(48, 69, 7, 21, 40, '01', 'Odd', 8),--25
(48, 70, 7, 22, 40, '02', 'Even', 8),--26
(35, 61, 7, 1 , 45, '01', 'Odd', 10),--27
(36, 62, 7, 2 , 45, '01', 'Even', 10),--28
(4, 133, 7, 24, 60, '01', 'Odd', 13),--29
(47, 63, 7, 3 , 45, '01', 'Even', 13),--30
(51, 64, 7, 4 , 45, '01', 'Odd', 15),--31
(49, 65, 7, 5 , 45, '01', 'Even', 15),--32
(49, 66, 7, 6, 45, '02', 'Odd', 8),--33
(81, 67, 7, 7, 45, '01', 'Even', 8),--34
(14, 122,7, 23, 80, '01', 'Odd', 10),--35
(6, 142, 7, 26, 95, '01', 'Even', 10),--36
(1, 134, 7, 25, 60, '01', 'Odd', 13),--37
(52, 68, 7, 8 , 40, '01', 'Even', 13),--38
(50, 69, 7, 9, 40, '01', 'Odd', 15),--39
(44, 78, 7, 18, 90, '01', 'Even', 15),--40
(46, 70, 7, 10, 40, '01', 'Odd', 8),--41
(82, 61, 7, 11, 40, '01', 'Even', 8),--42
(96, 62, 7, 12, 40, '01', 'Odd', 10),--43
(53, 63 ,7, 13 , 40, '01', 'Even', 10),--44
(108,135,7, 24, 60, '01', 'Odd', 13),--45
(91, 64 ,7, 14, 40, '01', 'Even', 13),--46
(83, 123, 7, 23, 80, '01', 'Odd', 15),--47
(92, 65 , 7, 15, 40, '01', 'Even', 15),--48
(98, 66 , 7, 1, 40, '01', 'Odd', 8),--49
(104, 67, 7, 2 ,35, '01', 'Even', 8),--50 
(109,136, 7,25, 60, '01', 'Odd', 10),--51
(85, 68 , 7, 3, 40, '01', 'Even', 10),--52
(88, 69 , 7, 4, 40, '01', 'Odd', 13),--53
(84, 70 , 7, 5, 40, '01', 'Even', 13),--54
(94, 61 , 7, 6, 40, '01', 'Odd', 15),--55
(97 , 62, 7, 7, 40, '01', 'Even', 15),--56
(110,137, 7,24, 60, '01', 'Odd', 8),--57
(99 , 63, 7, 8, 40, '01', 'Even', 8),--58
(87 , 64, 7, 9, 40, '01', 'Odd', 10),--59
(102, 65, 7,10, 40, '01', 'Even', 10),--60
(90 , 66, 7,11, 40, '01', 'Odd', 13),--61
(111, 138,7, 25 , 60, '01', 'Even', 13),--62
(100, 67, 7, 12, 40, '01', 'Odd', 15),--63

(21, 71, 8, 1, 80, '01', 'Odd', 8),--1
(21, 72, 8, 2, 80, '02', 'Even', 8),--2
(28, 81, 8, 3, 70, '01', 'Odd', 10), --3
(28, 82, 8, 4, 70, '02', 'Even', 10), --4
(32, 61, 8, 5, 50, '01', 'Odd', 13),--5
(32, 62, 8, 6, 50, '02', 'Even', 13),--6
(79, 63, 8, 7, 40, '01', 'Odd', 15), --7
(78, 64, 8, 8, 90, '01', 'Even', 15), --8
(12, 121, 8, 23, 80, '01', 'Odd', 8), --9
(5, 141, 8, 26, 95, '01', 'Even', 8), --10
(2, 131, 8, 24, 60, '01', 'Odd', 10),--11
(22, 73, 8, 9, 100, '01', 'Even', 10),--12
(22, 74, 8, 10, 100, '02', 'Odd', 13),--13
(29, 83, 8, 11, 70, '01', 'Even', 13),--14
(29, 84, 8, 12, 70, '02', 'Odd', 15),--15
(33, 65, 8, 13, 50, '01', 'Even', 15),--16
(33, 66, 8, 14, 50, '02', 'Odd', 8),--17
(34, 67, 8, 15, 50, '01', 'Even', 8),--18
(23, 75, 8, 16, 100, '01', 'Odd', 10),--19
(31, 85, 8, 17, 30, '01', 'Even', 10),--20
(3, 132, 8, 25, 60, '01', 'Odd', 13),--21
(26, 76, 8, 18, 90, '01', 'Even', 13),--22
(24, 77, 8, 19, 90, '01', 'Odd', 15),--23
(80, 68, 8, 20, 40, '01', 'Even', 15),--24
(48, 69, 8, 21, 40, '01', 'Odd', 8),--25
(48, 70, 8, 22, 40, '02', 'Even', 8),--26
(35, 61, 8, 1 , 45, '01', 'Odd', 10),--27
(36, 62, 8, 2 , 45, '01', 'Even', 10),--28
(4, 133, 8, 24, 60, '01', 'Odd', 13),--29
(47, 63, 8, 3 , 45, '01', 'Even', 13),--30
(51, 64, 8, 4 , 45, '01', 'Odd', 15),--31
(49, 65, 8, 5 , 45, '01', 'Even', 15),--32
(49, 66, 8, 6, 45, '02', 'Odd', 8),--33
(81, 67, 8, 7, 45, '01', 'Even', 8),--34
(14, 122,8, 23, 80, '01', 'Odd', 10),--35
(6, 142, 8, 26, 95, '01', 'Even', 10),--36
(1, 134, 8, 25, 60, '01', 'Odd', 13),--37
(52, 68, 8, 8 , 40, '01', 'Even', 13),--38
(50, 69, 8, 9, 40, '01', 'Odd', 15),--39
(44, 78, 8, 18, 90, '01', 'Even', 15),--40
(46, 70, 8, 10, 40, '01', 'Odd', 8),--41
(82, 61, 8, 11, 40, '01', 'Even', 8),--42
(96, 62, 8, 12, 40, '01', 'Odd', 10),--43
(53, 63 ,8, 13 , 40, '01', 'Even', 10),--44
(108,135,8, 24, 60, '01', 'Odd', 13),--45
(91, 64 ,8, 14, 40, '01', 'Even', 13),--46
(83, 123,8, 23, 80, '01', 'Odd', 15),--47
(92, 65 , 8, 15, 40, '01', 'Even', 15),--48
(98, 66 , 8, 1, 40, '01', 'Odd', 8),--49
(104, 67, 8, 2 ,35, '01', 'Even', 8),--50 
(109,136, 8,25, 60, '01', 'Odd', 10),--51
(85, 68 , 8, 3, 40, '01', 'Even', 10),--52
(88, 69 , 8, 4, 40, '01', 'Odd', 13),--53
(84, 70 , 8, 5, 40, '01', 'Even', 13),--54
(94, 61 , 8, 6, 40, '01', 'Odd', 15),--55
(97 , 62, 8, 7, 40, '01', 'Even', 15),--56
(110,137, 8,24, 60, '01', 'Odd', 8),--57
(99 , 63, 8, 8, 40, '01', 'Even', 8),--58
(87 , 64, 8, 9, 40, '01', 'Odd', 10),--59
(102, 65, 8,10, 40, '01', 'Even', 10),--60
(90 , 66, 8,11, 40, '01', 'Odd', 13),--61
(111, 138,8, 25 , 60, '01', 'Even', 13),--62
(100, 67, 8, 12, 40, '01', 'Odd', 15);
GO
DBCC CHECKIDENT ('Education.Offered_Course', RESEED, 426);
GO
INSERT INTO Education.Offered_Course (course_id, instructor_id, semester_id, room_id, capacity, section_number, class_day_type, start_hour) VALUES
(86, 68, 1, 22, 30, '01', 'Even', 13),
(89, 69, 1, 22, 30, '02', 'Odd', 13),
(105, 63, 1, 17, 30, '01', 'Even', 15),
(107, 65, 1, 19, 30, '01', 'Odd', 10),
(106, 70, 1, 19, 30, '02', 'Even', 10),
(95, 66, 1, 4, 45, '01', 'Odd', 10),
(93, 70, 1, 5, 40, '01', 'Even', 13),
(99, 64, 1, 6, 40, '01', 'Odd', 15),
(101, 67, 1, 7, 40, '01', 'Even', 15),
(103, 65, 1, 8, 40, '01', 'Odd', 8),
(86, 68, 2, 22, 30, '01', 'Even', 13),
(89, 69, 2, 22, 30, '02', 'Odd', 13),
(105, 63, 2, 17, 30, '01', 'Even', 15),
(107, 65, 2, 19, 30, '01', 'Odd', 10),
(106, 70, 2, 19, 30, '02', 'Even', 10),
(95, 66, 2, 4, 45, '01', 'Odd', 10),
(93, 70, 2, 5, 40, '01', 'Even', 13),
(99, 64, 2, 6, 40, '01', 'Odd', 15),
(101, 67, 2, 7, 40, '01', 'Even', 15),
(103, 65, 2, 8, 40, '01', 'Odd', 8),
(86, 68, 3, 22, 30, '01', 'Even', 13),
(89, 69, 3, 22, 30, '02', 'Odd', 13),
(105, 63, 3, 17, 30, '01', 'Even', 15),
(107, 65, 3, 19, 30, '01', 'Odd', 10),
(106, 70, 3, 19, 30, '02', 'Even', 10),
(95, 66, 3, 4, 45, '01', 'Odd', 10),
(93, 70, 3, 5, 40, '01', 'Even', 13),
(101, 67, 3, 7, 40, '01', 'Even', 15),
(103, 65, 3, 8, 40, '01', 'Odd', 8),
(86, 68, 4, 22, 30, '01', 'Even', 13),
(89, 69, 4, 22, 30, '02', 'Odd', 13),
(105, 63, 4, 17, 30, '01', 'Even', 15),
(107, 65, 4, 19, 30, '01', 'Odd', 10),
(106, 70, 4, 19, 30, '02', 'Even', 10),
(95, 66, 4, 4, 45, '01', 'Odd', 10),
(93, 70, 4, 5, 40, '01', 'Even', 13),
(101, 67, 4, 7, 40, '01', 'Even', 15),
(103, 65, 4, 8, 40, '01', 'Odd', 8),
(86, 68, 5, 22, 30, '01', 'Even', 13),
(89, 69, 5, 22, 30, '02', 'Odd', 13),
(105, 63, 5, 17, 30, '01', 'Even', 15),
(107, 65, 5, 19, 30, '01', 'Odd', 10),
(106, 70, 5, 19, 30, '02', 'Even', 10),
(95, 66, 5, 4, 45, '01', 'Odd', 10),
(93, 70, 5, 5, 40, '01', 'Even', 13),
(101, 67, 5, 7, 40, '01', 'Even', 15),
(103, 65, 5, 8, 40, '01', 'Odd', 8),
(86, 68, 6, 22, 30, '01', 'Even', 13),
(89, 69, 6, 22, 30, '02', 'Odd', 13),
(105, 63, 6, 17, 30, '01', 'Even', 15),
(107, 65, 6, 19, 30, '01', 'Odd', 10),
(106, 70, 6, 19, 30, '02', 'Even', 10),
(95, 66, 6, 4, 45, '01', 'Odd', 10),
(93, 70, 6, 5, 40, '01', 'Even', 13),
(101, 67, 6, 7, 40, '01', 'Even', 15),
(103, 65, 6, 8, 40, '01', 'Odd', 8),
(86, 68, 7, 22, 30, '01', 'Even', 13),
(89, 69, 7, 22, 30, '02', 'Odd', 13),
(105, 63, 7, 17, 30, '01', 'Even', 15),
(107, 65, 7, 19, 30, '01', 'Odd', 10),
(106, 70, 7, 19, 30, '02', 'Even', 10),
(95, 66, 7, 4, 45, '01', 'Odd', 10),
(93, 70, 7, 5, 40, '01', 'Even', 13),
(101, 67, 7, 7, 40, '01', 'Even', 15),
(103, 65, 7, 8, 40, '01', 'Odd', 8),
(86, 68, 8, 22, 30, '01', 'Even', 13),
(89, 69, 8, 22, 30, '02', 'Odd', 13),
(105, 63, 8, 17, 30, '01', 'Even', 15),
(107, 65, 8, 19, 30, '01', 'Odd', 10),
(106, 70, 8, 19, 30, '02', 'Even', 10),
(95, 66, 8, 4, 45, '01', 'Odd', 10),
(93, 70, 8, 5, 40, '01', 'Even', 13),
(101, 67, 8, 7, 40, '01', 'Even', 15),
(103, 65, 8, 8, 40, '01', 'Odd', 8);
GO
DBCC CHECKIDENT ('Education.Offered_Course', RESEED, 558);
GO
INSERT INTO Education.Offered_Course ( course_id, instructor_id, semester_id, room_id, capacity, section_number, class_day_type, start_hour) VALUES
( 21, 71, 1, 1, 80, '01', 'Odd', 8),
( 21, 72, 1, 2, 80, '02', 'Even', 8),
( 28, 81, 1, 3, 70, '01', 'Odd', 10),
( 28, 82, 1, 4, 70, '02', 'Even', 10),
( 32, 61, 1, 5, 50, '01', 'Odd', 13),
( 32, 62, 1, 6, 50, '02', 'Even', 13),
( 79, 63, 1, 7, 40, '01', 'Odd', 15),
( 78, 64, 1, 8, 90, '01', 'Even', 15),
( 12, 121, 1, 23, 80, '01', 'Odd', 8),
( 5, 141, 1, 26, 95, '01', 'Even', 8),
( 2, 131, 1, 24, 60, '01', 'Odd', 10),
( 22, 73, 1, 9, 100, '01', 'Even', 10),
( 22, 74, 1, 10, 100, '02', 'Odd', 13),
(29, 83, 1, 11, 70, '01', 'Even', 13),
( 29, 84, 1, 12, 70, '02', 'Odd', 15),
( 33, 65, 1, 13, 50, '01', 'Even', 15),
( 33, 66, 1, 14, 50, '02', 'Odd', 8),
( 34, 67, 1, 15, 50, '01', 'Even', 8),
(23, 75, 1, 16, 100, '01', 'Odd', 10),
( 31, 85, 1, 17, 30, '01', 'Even', 10),
( 3, 132, 1, 25, 60, '01', 'Odd', 13),
( 26, 76, 1, 18, 90, '01', 'Even', 13),
( 24, 77, 1, 19, 90, '01', 'Odd', 15),
( 80, 68, 1, 20, 40, '01', 'Even', 15),
( 48, 69, 1, 21, 40, '01', 'Odd', 8),
( 48, 70, 1, 22, 40, '02', 'Even', 8),
( 35, 61, 1, 1, 45, '01', 'Odd', 10),
( 36, 62, 1, 2, 45, '01', 'Even', 10),
( 4, 133, 1, 24, 60, '01', 'Odd', 13),
( 47, 63, 1, 3, 45, '01', 'Even', 13),
(51, 64, 1, 4, 45, '01', 'Odd', 15),
( 49, 65, 1, 5, 45, '01', 'Even', 15),
( 49, 66, 1, 6, 45, '02', 'Odd', 8),
( 81, 67, 1, 7, 45, '01', 'Even', 8),
( 14, 122, 1, 23, 80, '01', 'Odd', 10),
( 6, 142, 1, 26, 95, '01', 'Even', 10),
( 1, 134, 1, 25, 60, '01', 'Odd', 13),
( 52, 68, 1, 8, 40, '01', 'Even', 13),
( 50, 69, 1, 9, 40, '01', 'Odd', 15),
( 44, 78, 1, 18, 90, '01', 'Even', 15),
( 46, 70, 1, 10, 40, '01', 'Even', 8),
( 82, 61, 1, 11, 40, '01', 'Even', 8),
( 96, 62, 1, 12, 40, '01', 'Odd', 10),
( 53, 63, 1, 13, 40, '01', 'Even', 10),
( 108, 135, 1, 24, 60, '01', 'Odd', 13),
( 91, 64, 1, 14, 40, '01', 'Even', 13),
( 83, 123, 1, 23, 80, '01', 'Odd', 15),
( 92, 65, 1, 15, 40, '01', 'Even', 15),
( 98, 66, 1, 1, 40, '01', 'Odd', 8),
( 104, 67, 1, 2, 35, '01', 'Even', 8),
( 109, 136, 1, 25, 60, '01', 'Odd', 10),
( 85, 68, 1, 3, 40, '01', 'Even', 10),
( 88, 69, 1, 4, 40, '01', 'Odd', 13),
( 84, 70, 1, 5, 40, '01', 'Even', 13),
( 94, 61, 1, 6, 40, '01', 'Odd', 15),
( 97, 62, 1, 7, 40, '01', 'Even', 15),
( 110, 137, 1, 24, 60, '01', 'Odd', 8),
( 87, 64, 1, 9, 40, '01', 'Odd', 10),
( 102, 65, 1, 10, 40, '01', 'Even', 10),
( 90, 66, 1, 11, 40, '01', 'Odd', 13),
(111, 138, 1, 25, 60, '01', 'Even', 13),
( 100, 67, 1, 12, 40, '01', 'Odd', 15),
( 21, 71, 2, 1, 80, '01', 'Odd', 8),
( 21, 72, 2, 2, 80, '02', 'Even', 8),
( 28, 81, 2, 3, 70, '01', 'Odd', 10),
( 28, 82, 2, 4, 70, '02', 'Even', 10),
(32, 61, 2, 5, 50, '01', 'Odd', 13),
( 32, 62, 2, 6, 50, '02', 'Even', 13),
( 79, 63, 2, 7, 40, '01', 'Odd', 15),
(78, 64, 2, 8, 90, '01', 'Even', 15),
( 12, 121, 2, 23, 80, '01', 'Odd', 8),
( 5, 141, 2, 26, 95, '01', 'Even', 8),
( 2, 131, 2, 24, 60, '01', 'Odd', 10),
( 22, 73, 2, 9, 100, '01', 'Even', 10),
( 22, 74, 2, 10, 100, '02', 'Odd', 13),
( 29, 83, 2, 11, 70, '01', 'Even', 13),
( 29, 84, 2, 12, 70, '02', 'Odd', 15),
( 33, 65, 2, 13, 50, '01', 'Even', 15),
( 33, 66, 2, 14, 50, '02', 'Odd', 8),
( 34, 67, 2, 15, 50, '01', 'Even', 8),
(23, 75, 2, 16, 100, '01', 'Odd', 10),
(31, 85, 2, 17, 30, '01', 'Even', 10),
(3, 132, 2, 25, 60, '01', 'Odd', 13),
(26, 76, 2, 18, 90, '01', 'Even', 13),
(24, 77, 2, 19, 90, '01', 'Odd', 15),
(80, 68, 2, 20, 40, '01', 'Even', 15),
(48, 69, 2, 21, 40, '01', 'Odd', 8),
(48, 70, 2, 22, 40, '02', 'Even', 8),
(35, 61, 2, 1, 45, '01', 'Odd', 10),
(36, 62, 2, 2, 45, '01', 'Even', 10),
(4, 133, 2, 24, 60, '01', 'Odd', 13),
(47, 63, 2, 3, 45, '01', 'Even', 13),
(51, 64, 2, 4, 45, '01', 'Odd', 15),
(49, 65, 2, 5, 45, '01', 'Even', 15),
(49, 66, 2, 6, 45, '02', 'Odd', 8),
(81, 67, 2, 7, 45, '01', 'Even', 8),
(14, 122, 2, 23, 80, '01', 'Odd', 10),
(6, 142, 2, 26, 95, '01', 'Even', 10),
(1, 134, 2, 25, 60, '01', 'Odd', 13),
(52, 68, 2, 8, 40, '01', 'Even', 13),
(50, 69, 2, 9, 40, '01', 'Odd', 15),
(44, 78, 2, 18, 90, '01', 'Even', 15),
(46, 70, 2, 10, 40, '01', 'Odd', 8),
(82, 61, 2, 11, 40, '01', 'Even', 8),
(96, 62, 2, 12, 40, '01', 'Odd', 10),
(53, 63, 2, 13, 40, '01', 'Even', 10),
(108, 135, 2, 24, 60, '01', 'Odd', 13),
(91, 64, 2, 14, 40, '01', 'Even', 13),
(83, 123, 2, 23, 80, '01', 'Odd', 15),
(92, 65, 2, 15, 40, '01', 'Even', 15),
(98, 66, 2, 1, 40, '01', 'Odd', 8),
(104, 67, 2, 2, 35, '01', 'Even', 8),
(109, 136, 2, 25, 60, '01', 'Odd', 10),
(85, 68, 2, 3, 40, '01', 'Even', 10),
(88, 69, 2, 4, 40, '01', 'Odd', 13),
(84, 70, 2, 5, 40, '01', 'Even', 13),
(94, 61, 2, 6, 40, '01', 'Odd', 15),
(97, 62, 2, 7, 40, '01', 'Even', 15),
(110, 137, 2, 24, 60, '01', 'Odd', 8),
(87, 64, 2, 9, 40, '01', 'Odd', 10),
(102, 65, 2, 10, 40, '01', 'Even', 10),
(90, 66, 2, 11, 40, '01', 'Odd', 13),
(111, 138, 2, 25, 60, '01', 'Even', 13),
(100, 67, 2, 12, 40, '01', 'Odd', 15);
GO

---------------------------------------------------------------------------------------------------

-- Prerequisite

INSERT INTO Education.Prerequisite (course_id, prerequisite_course_id) VALUES
-- Term 2 Prerequisites
(22, 21),   -- Mathematics 2 requires Mathematics 1
(29, 28),   -- Physics 2 requires Physics 1
(33, 32),   -- Advanced Programming requires Computer Programming Fundamentals
(23, 22),   -- Differential Equations requires Mathematics 2 (as co-requisite)
(31, 29),   -- Physics 2 Lab requires Physics 2 (as co-requisite)
-- Term 3 Prerequisites
(26, 22),   -- Engineering Probability and Statistics requires Mathematics 2
(24, 22),   -- Engineering Mathematics requires Mathematics 2
(24, 23),   -- Engineering Mathematics requires Differential Equations
(80, 29),   -- Electrical and Electronic Circuits requires Physics 2
(80, 23),   -- Electrical and Electronic Circuits requires Differential Equations (as co-requisite)
(48, 33),   -- Data Structures requires Advanced Programming
(36, 35),   -- Digital Systems Design 1 Lab requires Digital Systems Design 1 (as co-requisite)
-- Term 4 Prerequisites
(47, 35),   -- Computer Architecture and Organization requires Digital Systems Design 1
(51, 47),   -- Computer Networks 1 requires Computer Architecture and Organization (as co-requisite)
(49, 48),   -- Algorithms Design requires Data Structures
(81, 47),   -- Hardware Description Languages requires Computer Architecture and Organization (as co-requisite)
(14, 12),   -- Specialized English for Computer Engineering requires General English for Engineering
(6, 5),     -- Physical Education 2 requires Physical Education 1
-- Term 5 Prerequisites
(52, 47),   -- Microprocessors requires Computer Architecture and Organization
(50, 48),   -- Operating Systems requires Data Structures
(44, 24),   -- Signals and Systems requires Engineering Mathematics (as co-requisite)
(46, 48),   -- Artificial Intelligence requires Data Structures
(46, 49),   -- Artificial Intelligence requires Algorithms Design
(82, 48),   -- Languages and Automata Theory requires Data Structures
(96, 51),   -- Computer Networks Lab requires Computer Networks 1 (as co-requisite)
(53, 52),   -- Microprocessors Lab requires Microprocessors
(53, 36),   -- Microprocessors Lab requires Digital Systems Design 1 Lab
-- Term 6 Prerequisites
(91, 82),   -- Compiler requires Languages and Automata Theory
(83, 14),   -- Scientific and Technical Presentation requires Specialized English for Computer Engineering
(92, 49),   -- Fundamentals of Computational Intelligence requires Algorithms Design
(94, 49),   -- Fundamentals of Machine Vision requires Algorithms Design
(98, 51),   -- Computer Networks 2 requires Computer Networks 1
-- Term 7 Prerequisites (sample from software track)
(85, 88),   -- Software Engineering 1 requires Databases 1 (as co-requisite)
(89, 85),   -- Software Engineering 1 Lab requires Software Engineering 1 (as co-requisite)
(88, 48),   -- Databases 1 requires Data Structures
(84, 83),   -- Bachelors Project requires Scientific and Technical Presentation (as co-requisite)
-- Term 8 Prerequisites (sample from software track)
(87, 85),   -- Software Engineering 2 requires Software Engineering 1
(100, 49);  -- Cryptography Fundamentals requires Algorithms Design 
INSERT INTO Education.Prerequisite (course_id, prerequisite_course_id) VALUES
-- Lab Prerequisites (A lab usually requires its corresponding course)
(86, 85),   -- Software Engineering 1 Lab requires Software Engineering 1
(89, 88),   -- Database Lab requires Databases 1
(105, 52),  -- Interface Circuits Laboratory requires Microprocessors
(107, 92),  -- Computational Intelligence Lab requires Fundamentals of Computational Intelligence
(106, 93),  -- Machine Vision Lab requires Fundamentals of Machine Vision
-- Advanced Elective Prerequisites
(95, 51),   -- Computer Networks 2 requires Computer Networks 1
(93, 46),   -- Fundamentals of Machine Vision requires Artificial Intelligence
(101, 50),  -- Secure Computing Fundamentals requires Operating Systems
(101, 51),  -- Secure Computing Fundamentals also requires Computer Networks 1
(103, 85),  -- Secure Software Development requires Software Engineering 1
(102, 51);  -- Network Security requires Computer Networks 1 (Already existed, but good to confirm)
GO

---------------------------------------------------------------------------------------------------

-- student 
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202111001, 'Pouya', 'Rezayi', '5678901230', '2003-08-04', 2021, 8, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311001, 'Ali', 'Rezayi', '0019876548', '2005-03-15', 2023, 5, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311002, 'Sara', 'Ahmadi', '0023456787', '2005-07-22', 2023, 5, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311003, 'Reza', 'Hosseini', '0521659426', '2005-01-30', 2023, 5, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311004, 'Maryam', 'Karimi', '1219876542', '2005-11-11', 2023, 5, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311005, 'Amir', 'Mohammadi', '2298765431', '2005-04-02', 2023, 5, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311006, 'Fatemeh', 'Bagheri', '3875432101', '2005-09-18', 2023, 5, 22, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311007, 'Kian','Ebrahimi', '4412345671', '2005-02-25', 2023, 5, 21, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311008, 'Neda', 'Jafari', '5067890126', '2005-06-07', 2023, 5, 20, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311009, 'Sina', 'Hashemi', '0499300459', '2005-12-01', 2023, 5, 31, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311010, 'Parisa', 'Sadeghi', '0076543285', '2005-08-14', 2023, 5, 32, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311011, 'Arash', 'Mousavi', '0065432101', '2005-10-05', 2023, 5, 33, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311012, 'Shadi', 'Alizadeh', '0054321093', '2005-03-28', 2023, 5, 34, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311013, 'Babak', 'Rostami', '0043210988', '2005-05-19', 2023, 5, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311014, 'Yasaman', 'Ghasemi', '0032109873', '2005-07-31', 2023, 5, 26, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311015, 'Farhad', 'Niknam', '0021098761', '2005-11-23', 2023, 5, 25, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311016, 'Roya', 'Salimi', '0010987657', '2005-01-12', 2023, 5, 24, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES(202311017, 'Omid', 'Heydari', '0387654321', '2005-04-17', 2023, 5, 23, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311018, 'Tara', 'Moradi', '1218765437', '2005-08-08', 2023, 5, 22, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311019, 'Maziar', 'Soltani', '2297654324', '2005-06-21', 2023, 5, 21, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202311020, 'Lida', 'Azizi', '3874321096', '2005-09-03', 2023, 5, 20, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202111002, 'Mehdi', 'Tavakoli', '1382951329', '2003-09-10', 2021, 8, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202111002, 'Mehdi', 'Tavakoli', '1382951329', '2003-09-10', 2021, 8, 27, 'Active');
INSERT INTO Education.Student(student_id, first_name, last_name, national_id, birth_date, entry_year, current_term_number, major_id, student_status)
VALUES (202111003, 'Shima', 'Amiri', '0012543799', '2003-05-01', 2021, 8, 27, 'Active');

---------------------------------------------------------------------------------------------------

-- enrollment
--term 1
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311001,2,'2023-09-24','17'),
(202311001,4,'2023-09-24','18'),
(202311001,5,'2023-09-24','14.5'),
(202311001,8,'2023-09-24','16'),
(202311001,9,'2023-09-24','16.25'),
(202311001,7,'2023-09-24','19.9'),
(202311001,11,'2023-09-24','18.5'),
(202311001,10,'2023-09-24','17');
--term 2
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311001,75,'2024-02-08','15'),
(202311001,77,'2024-02-08','11.5'),
(202311001,80,'2024-02-08','18.25'),
(202311001,81,'2024-02-08','18'),
(202311001,82,'2024-02-08','17'),
(202311001,83,'2024-02-08','16'),
(202311001,84,'2024-02-08','17.75');
--term 3
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311001,148,'2024-09-27','18'),
(202311001,149,'2024-09-27','19'),
(202311001,150,'2024-09-27','18.25'),
(202311001,152,'2024-09-27','17'),
(202311001,153,'2024-09-27','16'),
(202311001,154,'2024-09-27','19.75');
--term 4
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311001,219,'2025-02-06','19'),
(202311001,220,'2025-02-06','19.5'),
(202311001,222,'2025-02-06','18.25'),
(202311001,223,'2025-02-06','17.8'),
(202311001,224,'2025-02-06','17'),
(202311001,225,'2025-02-06','19.75'),
(202311001,226,'2025-02-06','19.3');

--another student
--term 1
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311002, 2, '2023-09-24', '10.5'),
(202311002, 4, '2023-09-24', '12'),
(202311002, 5, '2023-09-24', '10'),
(202311002, 8, '2023-09-24', '12'),
(202311002, 9, '2023-09-24', '11.25'),
(202311002, 7, '2023-09-24', '10'),
(202311002, 11, '2023-09-24', '12'),
(202311002, 10, '2023-09-24', '11');
-- term 2
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311002, 75, '2024-02-08', '14'),
(202311002, 77, '2024-02-08', '16.5'),
(202311002, 80, '2024-02-08', '17.25'),
(202311002, 81, '2024-02-08', '12.5'),
(202311002, 82, '2024-02-08', '14'),
(202311002, 83, '2024-02-08', '14.75'),
(202311002, 84, '2024-02-08', '15.5');
--term 3
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311002, 148, '2024-09-02', '15'),
(202311002, 149, '2024-09-08', '12.5'),
(202311002, 150, '2024-09-08', '16.75'),
(202311002, 152, '2024-09-08', '13.75'),
(202311002, 153, '2024-09-08', '13'),
(202311002, 154, '2024-09-08', '17');
--term 4
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311002, 219, '2025-02-06', '12.75'),
(202311002, 220, '2025-02-06', '11.5'),
(202311002, 222, '2025-02-06', '10'),
(202311002, 223, '2025-02-06', '10.1'),
(202311002, 224, '2025-02-06', '13.5'),
(202311002, 225, '2025-02-06', '10.25'),
(202311002, 226, '2025-02-06', '11.3');


--another student
--term 1
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311003, 2, '2023-09-24', '18.5'),
(202311003, 4, '2023-09-24', '17'),
(202311003, 5, '2023-09-24', '16.75'),
(202311003, 8, '2023-09-24', '19'),
(202311003, 9, '2023-09-24', '17.25'),
(202311003, 7, '2023-09-24', '18'),
(202311003, 11, '2023-09-24', '16.5'),
(202311003, 10, '2023-09-24', '17.75');
--term 2
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311003, 75, '2024-02-08', '17.5'),
(202311003, 77, '2024-02-08', '16'),
(202311003, 80, '2024-02-08', '18.25'),
(202311003, 81, '2024-02-08', '19'),
(202311003, 82, '2024-02-08', '17'),
(202311003, 83, '2024-02-08', '16.75'),
(202311003, 84, '2024-02-08', '18.5');
--term 3
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311003, 148, '2024-09-02', '11.5'),
(202311003, 149, '2024-09-08', '10'),
(202311003, 150, '2024-09-08', '11'),
(202311003, 152, '2024-09-08', '12.5'),
(202311003, 153, '2024-09-08', '10.75'),
(202311003, 154, '2024-09-08', '10.25');
--term 4
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311003, 219, '2025-02-06', '10.75'),
(202311003, 220, '2025-02-06', '12'),
(202311003, 222, '2025-02-06', '10.5'),
(202311003, 223, '2025-02-06', '11.25'),
(202311003, 224, '2025-02-06', '13');

--another student
--term 1
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311004, 2, '2023-09-24', '12'),
(202311004, 4, '2023-09-24', '12'),
(202311004, 5, '2023-09-24', '12'),
(202311004, 8, '2023-09-24', '12'),
(202311004, 9, '2023-09-24', '12'),
(202311004, 7, '2023-09-24', '12'),
(202311004, 11, '2023-09-24', '12'),
(202311004, 10, '2023-09-24', '12');
--term 2
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311004, 75, '2024-02-08', '12'),
(202311004, 77, '2024-02-08', '12'),
(202311004, 80, '2024-02-08', '12'),
(202311004, 81, '2024-02-08', '12'),
(202311004, 82, '2024-02-08', '12'),
(202311004, 83, '2024-02-08', '12'),
(202311004, 84, '2024-02-08', '12');
--term 3
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311004, 148, '2024-09-02', '11.5'),
(202311004, 149, '2024-09-08', '10'),
(202311004, 150, '2024-09-08', '11'),
(202311004, 153, '2024-09-08', '10.75'),
(202311004, 154, '2024-09-08', '10.25');

--another student
--term 1
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111001, 254, '2021-09-24', '17'),
(202111001, 256, '2021-09-24', '18'),
(202111001, 257, '2021-09-24', '14.5'),
(202111001, 260, '2021-09-24', '16'),
(202111001, 261, '2021-09-24', '16.25'),
(202111001, 259, '2021-09-24', '19.9'),
(202111001, 263, '2021-09-24', '18.5'),
(202111001, 262, '2021-09-24', '17');
--term 2
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111001, 327, '2022-02-08', '15'),
(202111001, 329, '2022-02-08', '11.5'),
(202111001, 332, '2022-02-08', '18.25'),
(202111001, 333, '2022-02-08', '18'),
(202111001, 334, '2022-02-08', '17'),
(202111001, 335, '2022-02-08', '16'),
(202111001, 336, '2022-02-08', '17.75');
--term 3
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111001, 580, '2022-09-27', '18'),
(202111001, 581, '2022-09-27', '19'),
(202111001, 582, '2022-09-27', '18.25'),
(202111001, 584, '2022-09-27', '17'),
(202111001, 594, '2022-09-27', '16'),
(202111001, 585, '2022-09-27', '19.75'),
(202111001, 586, '2022-09-27', '19.75'),
(202111001, 587, '2022-09-27', '19.75');
--term 4
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111001, 651, '2023-02-06', '19'),
(202111001, 652, '2023-02-06', '19.5'),
(202111001, 654, '2023-02-06', '18.25'),
(202111001, 655, '2023-02-06', '17.8'),
(202111001, 656, '2023-02-06', '17'),
(202111001, 658, '2023-02-06', '19.75');
--term 5
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111001, 38, '2023-09-25', '19'),
(202111001, 39, '2023-09-25', '19.5'),
(202111001, 40, '2023-09-25', '18.25'),
(202111001, 42, '2023-09-25', '17.8'),
(202111001, 43, '2023-09-25', '16'),
(202111001, 44, '2023-09-25', '19'),
(202111001, 45, '2023-09-25', '18.3');
--term 6
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111001, 114, '2024-02-09', '19'),
(202111001, 109, '2024-02-09', '19.5'),
(202111001, 110, '2024-02-09', '18.25'),
(202111001, 111, '2024-02-09', '16'),
(202111001, 112, '2024-02-09', '16'),
(202111001, 116, '2024-02-09', '20'),
(202111001, 113, '2024-02-09', '17.5');
--term 7
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111001, 467, '2024-09-25', '18'),
(202111001, 466, '2024-09-25', '19.75'),
(202111001, 181, '2024-09-25', '17.25'),
(202111001, 186, '2024-09-25', '17.8'),
(202111001, 182, '2024-09-25', '17'),
(202111001, 178, '2024-09-25', '19.75'),
(202111001, 184, '2024-09-25', '19.3');
--term 8
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111001, 479, '2025-09-25', '18'),
(202111001, 477, '2025-09-25', '19.75'),
(202111001, 243, '2025-09-25', '17.25'),
(202111001, 474, '2025-09-25', '17.8'),
(202111001, 246, '2025-09-25', '17'),
(202111001, 248, '2025-09-25', '19.75'),
(202111001, 250, '2025-09-25', '19.3'),
(202111001, 251, '2025-09-25', '19.3');


--another student
--term 1
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111002, 254, '2021-09-24', '17'),
(202111002, 256, '2021-09-24', '17'),
(202111002, 257, '2021-09-24', '16.5'),
(202111002, 260, '2021-09-24', '17'),
(202111002, 261, '2021-09-24', '16.25'),
(202111002, 259, '2021-09-24', '18.9'),
(202111002, 263, '2021-09-24', '17.5'),
(202111002, 262, '2021-09-24', '17');
--term 2
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111002, 327, '2022-02-08', '17'),
(202111002, 329, '2022-02-08', '16.5'),
(202111002, 332, '2022-02-08', '18.25'),
(202111002, 333, '2022-02-08', '18'),
(202111002, 334, '2022-02-08', '17'),
(202111002, 335, '2022-02-08', '16.75'),
(202111002, 336, '2022-02-08', '17.75');
--term 3
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111002, 580, '2022-09-27', '17.4'),
(202111002, 581, '2022-09-27', '18'),
(202111002, 582, '2022-09-27', '17.25'),
(202111002, 584, '2022-09-27', '17'),
(202111002, 594, '2022-09-27', '18.1'),
(202111002, 585, '2022-09-27', '18.75'),
(202111002, 586, '2022-09-27', '16.75'),
(202111002, 587, '2022-09-27', '17');
--term 4
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111002, 651, '2023-02-06', '16'),
(202111002, 652, '2023-02-06', '19.5'),
(202111002, 654, '2023-02-06', '18.25'),
(202111002, 655, '2023-02-06', '17.8'),
(202111002, 656, '2023-02-06', '17'),
(202111002, 658, '2023-02-06', '19.75');
--term 5
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111002, 38, '2023-09-25', '18.4'),
(202111002, 39, '2023-09-25', '19'),
(202111002, 40, '2023-09-25', '18.25'),
(202111002, 42, '2023-09-25', '17.8'),
(202111002, 43, '2023-09-25', '16'),
(202111002, 44, '2023-09-25', '19'),
(202111002, 45, '2023-09-25', '18.3');
--term 6
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111002, 114, '2024-02-09', '19'),
(202111002, 109, '2024-02-09', '19.5'),
(202111002, 110, '2024-02-09', '18.25'),
(202111002, 111, '2024-02-09', '16'),
(202111002, 112, '2024-02-09', '16'),
(202111002, 116, '2024-02-09', '20'),
(202111002, 113, '2024-02-09', '17.5');
--term 7
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111002, 467, '2024-09-25', '18'),
(202111002, 466, '2024-09-25', '19.75'),
(202111002, 181, '2024-09-25', '17.25'),
(202111002, 186, '2024-09-25', '17.8'),
(202111002, 182, '2024-09-25', '17'),
(202111002, 178, '2024-09-25', '19.75'),
(202111002, 184, '2024-09-25', '19.3');
--term 8
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111002, 479, '2025-09-25', NULL),
(202111002, 477, '2025-09-25', NULL),
(202111002, 243, '2025-09-25', NULL),
(202111002, 474, '2025-09-25', NULL),
(202111002, 246, '2025-09-25', NULL),
(202111002, 248, '2025-09-25', NULL),
(202111002, 250, '2025-09-25', NULL),
(202111002, 251, '2025-09-25', NULL);


--another student
--term 1
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111003, 254, '2021-09-24', '18'),
(202111003, 256, '2021-09-24', '18'),
(202111003, 257, '2021-09-24', '18'),
(202111003, 260, '2021-09-24', '18'),
(202111003, 261, '2021-09-24', '18'),
(202111003, 259, '2021-09-24', '18'),
(202111003, 263, '2021-09-24', '18'),
(202111003, 262, '2021-09-24', '18');
--term 2
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111003, 327, '2022-02-08', '18'),
(202111003, 329, '2022-02-08', '18'),
(202111003, 332, '2022-02-08', '18'),
(202111003, 333, '2022-02-08', '18'),
(202111003, 334, '2022-02-08', '18'),
(202111003, 335, '2022-02-08', '18'),
(202111003, 336, '2022-02-08', '18');
--term 3
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111003, 580, '2022-09-27', '18'),
(202111003, 581, '2022-09-27', '18'),
(202111003, 582, '2022-09-27', '18'),
(202111003, 584, '2022-09-27', '18'),
(202111003, 594, '2022-09-27', '18'),
(202111003, 585, '2022-09-27', '18'),
(202111003, 586, '2022-09-27', '18'),
(202111003, 587, '2022-09-27', '18');
--term 4
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111003, 651, '2023-02-06', '18'),
(202111003, 652, '2023-02-06', '18'),
(202111003, 654, '2023-02-06', '18'),
(202111003, 655, '2023-02-06', '18'),
(202111003, 656, '2023-02-06', '18'),
(202111003, 658, '2023-02-06', '18');
--term 5
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111003, 38, '2023-09-25', '18'),
(202111003, 39, '2023-09-25', '18'),
(202111003, 40, '2023-09-25', '18'),
(202111003, 42, '2023-09-25', '18'),
(202111003, 43, '2023-09-25', '18'),
(202111003, 44, '2023-09-25', '18'),
(202111003, 45, '2023-09-25', '18');
--term 6
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111003, 114, '2024-02-09', '18'),
(202111003, 109, '2024-02-09', '18'),
(202111003, 110, '2024-02-09', '18'),
(202111003, 111, '2024-02-09', '18'),
(202111003, 112, '2024-02-09', '18'),
(202111003, 116, '2024-02-09', '18'),
(202111003, 113, '2024-02-09', '18');
--term 7
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111003, 467, '2024-09-25', '18'),
(202111003, 466, '2024-09-25', '18'),
(202111003, 181, '2024-09-25', '18'),
(202111003, 186, '2024-09-25', '18'),
(202111003, 182, '2024-09-25', '18'),
(202111003, 178, '2024-09-25', '18'),
(202111003, 184, '2024-09-25', '18');
--term 8
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202111003, 479, '2025-09-25', '18'),
(202111003, 477, '2025-09-25', '18'),
(202111003, 243, '2025-09-25', '18'),
(202111003, 474, '2025-09-25', '18'),
(202111003, 246, '2025-09-25', '18'),
(202111003, 248, '2025-09-25', '18'),
(202111003, 250, '2025-09-25', '18'),
(202111003, 251, '2025-09-25', NULL);

--another student
--term 1
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311005, 2, '2023-09-24', '18.5'),
(202311005, 4, '2023-09-24', '17'),
(202311005, 5, '2023-09-24', '16.75'),
(202311005, 8, '2023-09-24', '19'),
(202311005, 9, '2023-09-24', '17.25'),
(202311005, 7, '2023-09-24', '18'),
(202311005, 11, '2023-09-24', '16.5'),
(202311005, 10, '2023-09-24', '17.75');
--term 2
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311005, 75, '2024-02-08', '17.5'),
(202311005, 77, '2024-02-08', '16'),
(202311005, 80, '2024-02-08', '18.25'),
(202311005, 81, '2024-02-08', '19'),
(202311005, 82, '2024-02-08', '17'),
(202311005, 83, '2024-02-08', '16.75'),
(202311005, 84, '2024-02-08', '18.5');
--term 3
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311005, 148, '2024-09-02', '11.5'),
(202311005, 149, '2024-09-08', '10'),
(202311005, 150, '2024-09-08', '11'),
(202311005, 152, '2024-09-08', '11.5'),
(202311005, 153, '2024-09-08', '10.75'),
(202311005, 154, '2024-09-08', '10.25');
--term 4
INSERT INTO Education.Enrollment (student_id, offered_course_id, enrollment_date, grade) VALUES 
(202311005, 219, '2025-02-06', NULL),
(202311005, 220, '2025-02-06', NULL),
(202311005, 222, '2025-02-06', NULL),
(202311005, 223, '2025-02-06', NULL),
(202311005, 224, '2025-02-06', NULL);

---- Selects all offered courses for semester ID 6, along with their titles,
---- and orders the results by the offered course ID.
--SELECT
--    oc.*,
--    c.title
--FROM
--    Education.Offered_Course AS oc
--JOIN
--    Education.Course AS c ON oc.course_id = c.course_id
--WHERE
--    oc.semester_id = 6
--ORDER BY
--    offered_course_id;


