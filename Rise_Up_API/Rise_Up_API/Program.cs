
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddDbContext<DbHelper>();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();
//app.Use(async (context, next) =>
//{
//    if (context.Request.RouteValues["controller"].Equals("Users") || context.Request.RouteValues["controller"].Equals("Collection_Points") || context.Request.RouteValues["controller"].Equals("Material_Goods") || context.Request.RouteValues["controller"].Equals("Missions") || context.Request.RouteValues["controller"].Equals("Missions_Collection_Points") || context.Request.RouteValues["controller"].Equals("Missions_Collection_Points_Fileter_Query"))
//    {
//        await next.Invoke();
//    }
//    else
//    {
//        string token = context.Request.Headers["Token"];
//        using (var db = new DbHelper())
//        {
//            String email = TokenManagerRiseUpcs.ValidateToken(token);
//            if (email != null)
//            {
//                foreach (Users user in db.Users)
//                {
//                    if (user.e_mail.Equals(email))
//                    {
//                        await next.Invoke();
//                    }
//                }
//            }

//        }
//    }
//});
app.MapControllers();

app.Run();
