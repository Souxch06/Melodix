.class public final Li80;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public b:Lh70;

.field public c:Z

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Lwh0;

.field public i:Lwh0;


# direct methods
.method public constructor <init>(ILh70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Li80;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Li80;->b:Lh70;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Li80;->c:Z

    .line 10
    .line 11
    sget-object p1, Lwh0;->n:Lwh0;

    .line 12
    .line 13
    iput-object p1, p0, Li80;->h:Lwh0;

    .line 14
    .line 15
    iput-object p1, p0, Li80;->i:Lwh0;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(ILh70;I)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput p1, p0, Li80;->a:I

    .line 20
    iput-object p2, p0, Li80;->b:Lh70;

    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Li80;->c:Z

    .line 22
    sget-object p1, Lwh0;->n:Lwh0;

    iput-object p1, p0, Li80;->h:Lwh0;

    .line 23
    iput-object p1, p0, Li80;->i:Lwh0;

    return-void
.end method
