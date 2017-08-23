
if Product.all.count == 0 
    
    p = Product.create(name: "Example", product_type: "Product", is_assessed: false)

    p.scores.create(a1: 1, a2: 1, a3: 3, a4: 2, a5: 2, a6: 2, a7: 1, a8: 1, a9: 2, a10: 1, a11: 1, a12: 1, 
                b1: 1, b2: 1, b3: 2, b4: 2, b5: 3, b6: 2, b7: 3, b8: 2, 
                c1: 2, c2: 1, c3: 1, c4: 1, c5: 1, c6: 2, c7: 1, c8: 1, c9: 1, c10: 1, 
                d1: 1, d2: 1, d3: 2, d4: 2, d5: 2, d6: 2, d7: 2, d8: 1, 
                e1: 1, e2: 1, e3: 2, e4: 1)
end
