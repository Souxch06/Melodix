.class Landroidx/activity/ComponentActivity$6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# instance fields
.field public final synthetic j:Landroidx/activity/a;


# direct methods
.method public constructor <init>(Landroidx/activity/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/activity/ComponentActivity$6;->j:Landroidx/activity/a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 1

    .line 1
    sget-object v0, Lvh0;->ON_CREATE:Lvh0;

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v0, 0x21

    .line 8
    .line 9
    if-lt p2, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Landroidx/activity/ComponentActivity$6;->j:Landroidx/activity/a;

    .line 12
    .line 13
    iget-object p0, p0, Landroidx/activity/a;->p:Landroidx/activity/b;

    .line 14
    .line 15
    check-cast p1, Landroidx/activity/a;

    .line 16
    .line 17
    invoke-static {p1}, Lcm;->a(Landroid/app/Activity;)Landroid/window/OnBackInvokedDispatcher;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Landroidx/activity/b;->e:Landroid/window/OnBackInvokedDispatcher;

    .line 28
    .line 29
    iget-boolean p1, p0, Landroidx/activity/b;->g:Z

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroidx/activity/b;->c(Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
