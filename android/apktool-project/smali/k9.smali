.class public final synthetic Lk9;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/webkit/ValueCallback;


# instance fields
.field public final synthetic a:Ll9;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll9;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lk9;->a:Ll9;

    .line 5
    .line 6
    iput p2, p0, Lk9;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Lk9;->b:I

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lk9;->a:Ll9;

    .line 6
    .line 7
    invoke-static {p0, v0, p1}, Ll9;->a(Ll9;ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
