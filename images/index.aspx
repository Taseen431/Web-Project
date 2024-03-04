<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MyPortfolio.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Taseen</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

    <!--BoxIcon-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet' />
     <!--main file css-->
    <link rel="stylesheet" href="./assets/css/style.css" />
    <!--Unicons-->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
</head>
<body>
    <form id="form1" runat="server">
          <!--Header-->
    <header id="header">
        <div class="container">
        <a href="#" class="logo">
            <img src="assets/img/logo.jpg" alt="" class="img-fluid">
        </a>
        <ul class="menu">
            <li class="menu_item">
                <a href="#hero" class="menu_link active-link">Home</a>
            </li>
            <li class="menu_item">
                <a href="#about" class="menu_link">About</a>
            </li>
            <li class="menu_item">
                <a href="#resume" class="menu_link">Resume</a>
            </li>
            <li class="menu_item">
                <a href="#portfolio" class="menu_link">Project</a>
            </li>
            <li class="menu_item">
                <a href="#contact" class="menu_link">Contact</a>
            </li>
             
            <ion-icon name="close-outline" class="close_icon"></ion-icon>
        </ul>
        <ion-icon name="menu-outline" class="toggle_icon"></ion-icon>

        </div>
    </header>

    <main>
        <!--Hero Section-->
        <section class="hero section" id="hero">
            <div class="hero_container container grid">
            <div class="hero_content">
                <h4>Hi,there!</h4>
                <h1>I'm Taseen...
                    

                    <span class="typed" data-typed-items="Learner,Reader,Dreamer"></span>
                </h1>              
                <p>I have keen interest in Poetry and Problem solving,currently pursuing my undergrad at CSE,KUET.I am improving my skills in web and app development. My area of interest lies in Computational Biology, Bioinformatics and Deep Learning.
                    
               </p>
                <div class="hero_social">
                    <a href="#"><ion-icon name="logo-linkedin"></ion-icon></a>
                    <a href="#"><ion-icon name="logo-github"></ion-icon></a>
                    <a href="#"><ion-icon name="logo-twitter"></ion-icon></a>                      
                </div>
                <a href="#contact" class="btn">
                    Read More
                    <ion-icon name="chevron-forward-outline"></ion-icon>
                </a> </div>
                <div class="hero_img">
                    <img src="assets/img/final.jpg" alt="img-fluid">
                </div>
            </div>
    


        </section>

        <!--About section-->
        <section class="about section" id="about">
            <h2 class="section_title">About Me</h2>

            <div class="about_container container grid">
            <div class="about_img">
                <img src="assets/img/poetry.jpg" alt="" height="500" width="480">
            </div>
            <div class="about_content">
                <h1>Ink & Wonder: Verses from the Heart</h1>
                <p>I am a weaver of words, a seeker of hidden truths, and a dreamer who dances on the edge of metaphors.Poetry is my sanctuary—a place where emotions unfurl like petals,where silence speaks volumes,and where the ordinary transforms into the extraordinary.With ink-stained fingers,I conjure verses that resonate with the human experience.</p>
                <p>"The soul has been given its own ears to hear things that the mind does not understand"

                    -Rumi</p>
                <div class="about_info">
                    <div>
                        <span class="number">350+</span>
                        <br>
                        <span class="text">Writings<br>Poem</span>
                    </div>
                    <div>
                        <span class="number">200</span>
                        <br>
                        <span class="text">Positive<br>review's</span>
                    </div>
                </div>
            </div>
            </div>



        </section>

        <!--===========Resume==========-->
        <section class="resume section" id="resume">
            <h2 class="section_title">Resume</h2>

            <div class="resume_container container grid">
                <div class="resume_tabs">
                    <ul>
                        <li>
                            <a href="#page-1">Education</a>
                        </li>
                        <li>
                            <a href="#page-2">Olympiad</a>
                        </li>
                        <li>
                            <a href="#page-3" >Skills</a>
                        </li>
                        
                    </ul>
                </div>
                <div class="resume_content">
                    <div id="page-1" class="page one">
                        <div class="page_heading">Education</div>
                         <asp:Repeater ID="rptEducation" runat="server">
                         <ItemTemplate>
                         <div class="resume_wrap">
                         <div class="resume_wrap-icon">
                            <i class="uil uil-graduation-cap"></i>
                         </div>
                         <div class="resume_wrap-content">
                         <span class="date"><%# Eval("Date") %></span>
                         <h4><%# Eval("Degree") %></h4>
                         <span class="position"><%# Eval("Institution") %></span>
                         <p><%# Eval("Description") %></p>
                        </div>
                      </div>
                   </ItemTemplate>
                 </asp:Repeater>

                    </div>

                    <div id="page-2" class="page two">
                        <div class="page_heading">Olympiad</div>
                        <asp:Repeater ID="rptOlympiad" runat="server">
                      <ItemTemplate>
                         <div class="resume_wrap">
                             <div class="resume_wrap-icon">
                                  <i class="uil uil-award"></i>
                             </div>
                          <div class="resume_wrap-content">
                                <span class="date"><%# Eval("Date") %></span>
                             <h4><%# Eval("Title") %></h4>
                                     <span class="position"><%# Eval("Position") %></span>
                                 <p><%# Eval("Description") %></p>
                           </div>
                        </div>
                    </ItemTemplate>
                    </asp:Repeater>

                        
                    </div>  

                    <div id="page-3" class="page three">
                            <div class="page_heading">Skills</div>
                            <div class="progressBoxs grid">
                             <asp:Repeater ID="rptSkills" runat="server">
                             <ItemTemplate>
                             <div class="progressBox">
                             <div class="progress_name">
                             <span><%# Eval("SkillName") %></span>
                             <span><%# Eval("SkillPercentage") %></span>
                            </div>
                          <div class="progress">
                            <div class="progress_bar" style="width: <%# Eval("SkillPercentage") %>%;"></div>
                            </div>
                          </div>
                        </ItemTemplate>
                     </asp:Repeater>

                      </div>
                   </div>

                    

                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


         <!--===========Project==========-->
         <section class="portfolio section" id="portfolio">
            <h2 class="section_title">Projects</h2>
            <div class="portfolio_container container">
                <ul class="portfolio_filters">
                   
                    <li data-filter=".filter-app">App</li>
                    <li data-filter=".filter-card">OOP</li>
                    <li data-filter=".filter-web">Web</li>
                </ul>
                <div class="portfolio_wrap-container">
               <div class="portfolio_item filter-web">
    <div class="portfolio_wrap">
        <img src="assets/img/port.png" alt="img-fluid" />
        <div class="portfolio_info">
            <h4>Web</h4>
            <p>Web</p>
            <div class="portfolio_links">
                <a href="#"><i class="uil uil-plus"></i></a>

            </div>
        </div>
    </div>
</div>

<div class="portfolio_item filter-card">
    <div class="portfolio_wrap">
        <img src="assets/img/raill.png" alt="img-fluid" />
        <div class="portfolio_info">
            <h4>OPP</h4>
            <p>OPP</p>
            <div class="portfolio_links">
                <a href="https://github.com/Taseen431/Railway-Management.git"><i class="uil uil-plus"></i></a>
                
            </div>
        </div>
    </div>
</div>

<div class="portfolio_item filter-web">
    <div class="portfolio_wrap">
        <img src="assets/img/passport.png" alt="img-fluid" />
        <div class="portfolio_info">
            <h4>App</h4>
            <p>App</p>
            <div class="portfolio_links">
                <a href="https://github.com/Taseen431/E-Passport.git"><i class="uil uil-plus"></i></a>
                
            </div>
        </div>
    </div>
</div>

            </div>
                </div>
         </section>


         <!---Testimonial Section-->

         <section class="services section container" id="services">
            <h2 class="section_title">Leisure pursuit</h2> 
            <div class="services__container grid">
   
             <div class="services__item">
               <div class="icon__box">
                 <img
                     src="assets/img/movie.jpg"
                     alt=""
                     class="services__icon"/>
                    <div class="services__dot">
                     <span class="dot"></span>
                    </div>
               </div>
   
               <h3 class="services__title text-lg">Cinema Enthusiast</h3>
               <p class="services detail">As a devoted movie buff, I find solace in the flickering frames of cinema. Among the countless directors, Abbas Kiarostami stands as my beacon. His films—poetic, introspective, and layered—unfold like delicate petals. From the Koker trilogy to the enigmatic Taste of Cherry, Kiarostami’s lens captures life’s nuances. His legacy transcends screens, echoing in my love for storytelling. 🎥🌟

               </p>
             </div>
             
             <div class="services__item">
               <div class="icon__box">
                 <img
                     src="assets/img/music.jpg"
                     alt=""
                     class="services__icon"/>
                    <div class="services__dot">
                     <span class="dot"></span>
                    </div>
               </div>
   
               <h3 class="services__title text-lg">Harmonious Passions</h3>
               <p class="services detail">Amid life's symphony,three distinct notes resonate—the haunting melodies of **Turkish music**,the soul-stirring verses of **Nusrat Fateh Ali Khan (NFAK)**,and the timeless ballads of **Freddie Mercury**.Each chord carries memories,dreams,and echoes of eternity.From the Anatolian plains to Sufi shrines,their harmonies intertwine,painting my soul with a kaleidoscope of emotions. 🎶🌟
                
                </p>
             </div>
   
             <div class="services__item">
               <div class="icon__box">
                 <img
                     src="assets/img/mime.jpg"
                     alt=""
                     class="services__icon"/>
                    <div class="services__dot">
                     <span class="dot"></span>
                    </div>
               </div>
   
               <h3 class="services__title text-lg">Mime Magic</h3>
               <p class="services detail">In the dim-lit theater, where words dissolve and silence reigns, I find solace. Mime—the art of expression without speech—becomes my refuge. The stage transforms into a canvas, and the mime artist, a maestro. Their movements—graceful, deliberate, and poignant—speak volumes. Invisible walls, imaginary objects, and invisible winds come alive. 

               </p>
               </p>
             </div>
   
            </div>  
         </section>

         <!----Contact Section-->

         <section class="contact section" id="contact">
            <h2 class="section_title">Contact Me</h2>

            <div class="contact_container container">
                <div class="contact_content">
                    <div class="inputs">
                        <input type="text" placeholder="Name">
                        <input type="email" placeholder="Email">
                    </div>
                    <input type="password" placeholder="password">
                    <textarea name="" id="" cols="30" rows="10" placeholder="Message"></textarea>
                    <a href="#" class="btn">Send Message
                        <ion-icon name="chevron-forward-outline"></ion-icon>
                    </a>
                </div>
            </div>

         </section>

         <!--===========Footer=========-->
         <footer>
            <div class="footer_bg">
                <div class="footer_container container">
                    <div class="main_footer">
                        <div class="footer_social">
                            <a href="#"><i class="bx bxl-facebook"></i></a>
                            <a href="#"><i class="bx bxl-instagram"></i></a>
                            <a href="#"><i class="bx bxl-twitter"></i></a>
                        </div>
                        <h3>Thank You.Have a good day!</h3>
                        <p>Taseen</p>
                        <center>
                            <asp:Button runat="server" ID="Button1" Text="Login" CssClass="Button" Style="width: 80px; height: 20px; font-size: 15px;text-align: center; line-height: 20px;" OnClick="Button1_Click" /> </center>

                    </div>
                    <div class="footer_copy">&#169;</div>
                </div>
            </div>
         </footer>

    </main>

        <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/mixitup/3.3.1/mixitup.min.js"></script>

        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        
        <!--typed js-->
        <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>

         <!--iocIcons-->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <!--Main Script-->
        <script src="assets/js/main.js"></script>
    </form>
</body>
</html>
