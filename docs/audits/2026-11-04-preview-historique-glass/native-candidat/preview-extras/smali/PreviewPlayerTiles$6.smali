.class Lcom/melodix/music/PreviewPlayerTiles$6;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->removable(Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$index:I

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$retry:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;ILandroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 204
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    iput p3, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$index:I

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$dialog:Landroid/app/Dialog;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$list:Landroid/widget/LinearLayout;

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 205
    new-instance p1, Landroid/app/Dialog;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    invoke-direct {p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-static {v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v1

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v3

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v5, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v5

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v6, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v4

    invoke-virtual {v0, v1, v3, v5, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 206
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v3, -0xde0e0de

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v3, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 207
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    const/high16 v3, 0x41880000    # 17.0f

    const-string v4, "Ce titre dans la file d\u2019attente"

    const/4 v5, -0x1

    invoke-static {v1, v2, v4, v5, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1000(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Ljava/lang/String;IF)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    new-instance v1, Landroid/widget/Button;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "Lire ensuite"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$6$1;

    invoke-direct {v2, p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$6$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles$6;Landroid/app/Dialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/high16 v4, 0x42400000    # 48.0f

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v3

    invoke-direct {v2, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 212
    new-instance v1, Landroid/widget/Button;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "Annuler"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$6$2;

    invoke-direct {v2, p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$6$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles$6;Landroid/app/Dialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 213
    new-instance v2, Landroid/widget/Button;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v3, "Retirer"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$6$3;

    invoke-direct {v3, p0, p1}, Lcom/melodix/music/PreviewPlayerTiles$6$3;-><init>(Lcom/melodix/music/PreviewPlayerTiles$6;Landroid/app/Dialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 216
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v6, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v6

    invoke-direct {v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$900(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result v3

    invoke-direct {v1, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method
